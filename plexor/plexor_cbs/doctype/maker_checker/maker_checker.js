frappe.ui.form.on("Maker-Checker", {
         refresh: function(frm) {
                frm.disable_save();
                frm.set_df_property('name', 'visibility', 'hidden');
                if (frm.doc.check_status==0) {
                    frm.set_intro('<b>Not yet reviewed</b>', 'gray');
                }
                else if (frm.doc.check_status==1) {
                    frm.set_intro('<b>Application approved and posted</b>', 'green');
                }
                else if (frm.doc.check_status==2) {
                    frm.set_intro('<b>Document review has started but is not yet complete</b>', 'blue');
                }
                else if (frm.doc.check_status==3) {
                    frm.set_intro('<b>Application Rejected</b>', 'red');
                }
                else if (frm.doc.check_status==4) {
                    frm.set_intro('<b>Refer Requested</b>', 'yellow');
                }


                frm.add_custom_button('View Document', () => {
                    reroute(frm.doc.document, frm.doc.document_id);
                }).removeClass('btn-default').addClass('btn-primary').css({'color':'white','background-color':'grey','font-weight': 'normal'});

                frm.add_custom_button('Approve', () => {
                    //alert(frappe.session.user);
                    checkers = frm.doc.checkers;
                    chksArr = checkers.replace("{","").replace("}","").replace("\n","").split(",");
                    approved = 0;
                    referred = 0;
                    for(x=0; x<=chksArr.length-1; x++)
                    {
                        console.log(chksArr[x]);
                        if(chksArr[x].length<=2)
                        {
                             chksArr.splice(x, 1);
                             continue;
                        }
                        if(chksArr[x].includes("approved"))
                            approved++;
                        else if(chksArr[x].includes("referred"))
                            referred++;
                        if(chksArr[x].startsWith(frappe.session.user)){
                            chksArr.splice(x, 1);
                            chksArr.push(frappe.session.user+": approved, ");
                            approved++;
                        }
                    }
                    console.log("approved="+approved+"   :   chksArr.length="+chksArr.length);
                    frappe.confirm('Please confirm, do you want to approve this update?',
                        () => {
                            checkers = chksArr.toString().replace(",,",",").replace(",",",\n");
                            frm.set_value('checkers', "{"+checkers+"}");
                            comments = frm.doc.checker_comments;
                            comments = comments + "\n\n"+frappe.session.user+" @"+get_current_datetime() +"\n  -  Approved this update.";
                            frm.set_value('checker_comments', comments);
                            if(approved>=(chksArr.length-referred) )
                            {
                                frm.set_value('check_status', '1'); //Approved
                                post_trx(frm.doc.name);
                            }
                            else
                            {
                                frm.set_value('check_status', '2'); //In progress
                                frm.dirty();
                                frm.save();
                            }
                        }, () => {
                            // action to perform if No is selected
                        });

                    //frm.doc.checkers = "{"+checkers+"}";
                }).removeClass('btn-default').addClass('btn-primary').css({'color':'white','background-color':'green','font-weight': 'normal'});

                frm.add_custom_button('Reject', () => {
                    checkers = frm.doc.checkers;
                    chksArr = checkers.replace("{","").replace("}","").replace("\n","").split(",");
                    approved = 0;
                    for(x=0; x<=chksArr.length-1; x++)
                    {
                        console.log(chksArr[x]);
                        if(chksArr[x].length<=2)
                        {
                             chksArr.splice(x, 1);
                             continue;
                        }
                        if(chksArr[x].includes("approved"))
                            approved++;
                        if(chksArr[x].startsWith(frappe.session.user)){
                            chksArr.splice(x, 1);
                            chksArr.push(frappe.session.user+": rejected, ");
                        }
                    }
                    console.log("approved="+approved+"   :   chksArr.length="+chksArr.length);
                    frappe.confirm('Please confirm, do you want to reject this update?',
                        () => {
                                let d = new frappe.ui.Dialog({
                                title: 'Enter details',
                                fields: [
                                    {
                                        label: 'Rejection Comments',
                                        fieldname: 'reasons',
                                        fieldtype: 'Text'
                                    },
                                ],
                                size: 'small', // small, large, extra-large
                                primary_action_label: 'Confirm',
                                primary_action(values) {
                                    checkers = chksArr.toString().replace(",,",",").replace(",",",\n");
                                    frm.set_value('checkers', "{"+checkers+"}");
                                    comments = frm.doc.checker_comments;
                                    comments = comments + "\n\n"+frappe.session.user+" @"+get_current_datetime() +"\n  -  Rejected this update.\nReasons Provided: "+values["reasons"];
                                    frm.set_value('checker_comments', comments);
                                    frm.set_value('check_status', '3'); //Rejected
                                    frm.dirty();
                                    frm.save();
                                    d.hide();
                                },
                                secondary_action_label: 'Cancel',
                                secondary_action(values) {
                                    console.log(values);
                                    d.hide();
                                }
                            });

                            d.show();
                        }, () => {
                            // action to perform if No is selected
                        });
                }).removeClass('btn-default').addClass('btn-primary').css({'color':'white','background-color':'red','font-weight': 'normal'});

                frm.add_custom_button('Refer', () => {
                    checkers = frm.doc.checkers;
                    chksArr = checkers.replace("{","").replace("}","").replace("\n","").split(",");
                    approved = 0;
                    for(x=0; x<=chksArr.length-1; x++)
                    {
                        console.log(chksArr[x]);
                        if(chksArr[x].length<=2)
                        {
                             chksArr.splice(x, 1);
                             continue;
                        }
                        if(chksArr[x].includes("approved"))
                            approved++;
                        if(chksArr[x].startsWith(frappe.session.user)){
                            chksArr.splice(x, 1);
                            chksArr.push(frappe.session.user+": referred, ");
                            approved++;
                        }
                    }
                    console.log("approved="+approved+"   :   chksArr.length="+chksArr.length);
                    frappe.confirm('Please confirm, do you want to refer this application?',
                        () => {
                            checkers = chksArr.toString().replace(",,",",").replace(",",",\n");
                            frm.set_value('checkers', "{"+checkers+"}");
                            comments = frm.doc.checker_comments;
                            comments = comments + "\n\n"+frappe.session.user+" @"+get_current_datetime() +"\n  -  Requested for refer.";
                            frm.set_value('checker_comments', comments);
                            frm.set_value('check_status', '4'); //Refer
                            frm.dirty();
                            frm.save();
                        }, () => {
                            // action to perform if No is selected
                        });
                }).removeClass('btn-default').addClass('btn-primary').css({'color':'white','background-color':'orange','font-weight': 'normal'});
         },
 });
