//
//  HTMLDesign.swift
//  WebviewHTML
//
//  Created by Sun on 18/11/2021.
//

import Foundation

struct HTMLDesign {
    static let popup =
        """
    <html lang="en"><head>
    <title>Lunar -  Free Bootstrap Modal and Popups  </title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://campaign-assets-01.moengage.com/inbound/inapp/html_inapp/campaigns/DemoAccount-E-commerce/163606189309_omg365/163723101375_70xwq4/assets/bootstrap/css/bootstrap.min.css">
    <!-- Lunar CSS -->
    <link rel="stylesheet" href="https://campaign-assets-01.moengage.com/inbound/inapp/html_inapp/campaigns/DemoAccount-E-commerce/163606189309_omg365/163723101375_70xwq4/assets/css/lunar.css">
    <!--<link rel="stylesheet" href="https://campaign-assets-01.moengage.com/inbound/inapp/html_inapp/campaigns/DemoAccount-E-commerce/163606189309_omg365/163723101375_70xwq4/assets/css/demo.css">-->
    <!-- Fonts -->
    <link rel="stylesheet" href="https://campaign-assets-01.moengage.com/inbound/inapp/html_inapp/campaigns/DemoAccount-E-commerce/163606189309_omg365/163723101375_70xwq4/assets/css/animate.min.css">
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:600" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Overpass:300,400,600,700,800,900" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="https://campaign-assets-01.moengage.com/inbound/inapp/html_inapp/campaigns/DemoAccount-E-commerce/163606189309_omg365/163723101375_70xwq4/assets/img/lunar.png">
    <link rel="icon" href="https://campaign-assets-01.moengage.com/inbound/inapp/html_inapp/campaigns/DemoAccount-E-commerce/163606189309_omg365/163723101375_70xwq4/assets/img/lunar.png" type="image/png" sizes="16x16">
    <style>
        .modal.fade.modal-bottom-right .modal-dialog {
            width: 100%;
            position: absolute;
            transform: translate(-50%, -50%);
            top: 50%;
            left: 48%;
            right: auto;
            bottom: auto;
        }
    </style>
    </head>
    <body class="modal-open">

    <!--<div class="demo-area">-->
    <!--    <button  type="button"  class="btn btn-dark btn-cta" data-toggle="modal" data-target="#demoModal">-->
    <!--        Open Modal-->
    <!--    </button>-->
    <!--</div>-->
    <!-- Modal -->
    <div class="modal fade modal-bottom-right show" id="demoModal" tabindex="-1" role="dialog" aria-labelledby="demoModal" aria-hidden="true" style="display: block;">

        <div class="modal-dialog  modal-sm" role="document">

            <div class="modal-content">
                <button type="button" class="close size-sm light" data-dismiss="modal" aria-label="Close" onclick="closeAction()">
                    <span aria-hidden="true">×</span>
                </button>
                <div class="modal-body bg-rhino px-sm-3 py-sm-3">
                    <div class="text-center pb-2"><img src="https://campaign-assets-01.moengage.com/inbound/inapp/html_inapp/campaigns/DemoAccount-E-commerce/163606189309_omg365/163723101375_70xwq4/assets/img/megaphone.png" alt=""></div>
                    <h3 class="text-white text-center ">Feedback</h3>
                    <p class="text-white-50">Your feedback is important to us. please fill the following</p>
                    <ul class="list-group">
                        <div class="list-group-item">
                            <div class="custom-control custom-radio">
                                <input type="radio" id="customRadio1" checked="" name="customRadio" class="custom-control-input" value="Service was not upto mark">
                                <label class="custom-control-label" for="customRadio1">Service was not
                                    upto mark.</label>
                            </div>
                        </div>

                        <div class="list-group-item">
                            <div class="custom-control custom-radio">
                                <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input" value="Service was Great.">
                                <label class="custom-control-label" for="customRadio2">Service was Great.</label>
                            </div>
                        </div>

                        <div class="list-group-item">
                            <div class="custom-control custom-radio">
                                <input type="radio" id="customRadio3" name="customRadio" class="custom-control-input" value="Pricing issues.">
                                <label class="custom-control-label" for="customRadio3">Pricing
                                    issues.</label>
                            </div>
                        </div>

                        <div class="list-group-item">
                            <div class="custom-control custom-radio">
                                <input type="radio" id="customRadio4" name="customRadio" class="custom-control-input" value="Recommend my friends.">
                                <label class="custom-control-label" for="customRadio4">Recommend my friends.</label>
                            </div>
                        </div>

                        <div class="list-group-item">
                            <div class="custom-control custom-radio">
                                <input type="radio" id="customRadio5" name="customRadio" class="custom-control-input" value="Great customer support">
                                <label class="custom-control-label" for="customRadio5">Great
                                    customer support</label>
                            </div>
                        </div>

                    </ul>
                    <div class="pt-2 text-center">
                        <a class="btn btn-cstm-light " data-dismiss="modal" aria-label="Close" onclick="shareFeedBackAction()">Share Feedback</a>
                    </div>

                </div>


            </div>
        </div>
    </div>
    <!-- Modal Ends -->




    <!--end content here-->
    <div id="image"></div>
    <script src="https://campaign-assets-01.moengage.com/inbound/inapp/html_inapp/campaigns/DemoAccount-E-commerce/163606189309_omg365/163723101375_70xwq4/assets/js/jquery.min.js"></script>
    <script src="https://campaign-assets-01.moengage.com/inbound/inapp/html_inapp/campaigns/DemoAccount-E-commerce/163606189309_omg365/163723101375_70xwq4/assets/js/popper.min.js"></script>
    <script src="https://campaign-assets-01.moengage.com/inbound/inapp/html_inapp/campaigns/DemoAccount-E-commerce/163606189309_omg365/163723101375_70xwq4/assets/bootstrap/js/bootstrap.min.js"></script>
    <script>
    function shareFeedBackAction() {
        var selectedValue=document.querySelector('input[name=customRadio]:checked').value;
        webkit.messageHandlers.submit.postMessage(selectedValue);
    }

    function closeAction() {
       webkit.messageHandlers.close.postMessage("close");
    }
    </script>
    <div class="modal-backdrop show"></div>

    </body></html>

    """
}
