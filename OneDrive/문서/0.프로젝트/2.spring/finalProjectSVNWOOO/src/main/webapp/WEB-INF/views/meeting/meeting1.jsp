<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>





 
<%@include file="../includes/header.jsp" %>


 
 <head>
 	<!-- zoom -->
	<link type="text/css" rel="stylesheet" href="https://source.zoom.us/1.9.8/css/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="https://source.zoom.us/1.9.8/css/react-select.css" />
 </head>
 
    


<style>
        .sdk-select {
            height: 34px;
            border-radius: 4px;
        }

        .websdktest button {
            float: right;
            margin-left: 5px;
        }

        #nav-tool {
            margin-bottom: 0px;
        }

        #show-test-tool {
            position: absolute;
            top: 100px;
            left: 0;
            display: block;
            z-index: 99999;
        }

        #display_name {
            width: 250px;
        }


        #websdk-iframe {
            width: 700px;
            height: 500px;
            border: 1px;
            border-color: red;
            border-style: dashed;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            left: 50%;
            margin: 0;
        }
    </style>

    <nav id="nav-tool" class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Zoom WebSDK</a>
            </div>
            <div id="navbar" class="websdktest">
                <form class="navbar-form navbar-right" id="meeting_form">
                    <div class="form-group">
                    	<label>ip</label>
                        <input type="text" name="display_name" id="display_name" value="1.9.8#CDN" maxLength="100"
                            placeholder="Name" class="form-control" required readonly="readonly">
                    </div>
                    <div class="form-group">
                    	<label>ZOOM meeting number</label>
                        <input type="text" name="meeting_number" id="meeting_number" value="2495821413" maxLength="200"
                            style="width:150px" placeholder="Meeting Number" class="form-control" required>
                    </div>
                    <div class="form-group">
                    	<label>meeting pwd</label>
                        <input type="text" name="meeting_pwd" id="meeting_pwd" value="1234" style="width:150px"
                            maxLength="32" placeholder="Meeting Password" class="form-control">
                    </div>
                    <div class="form-group">
                    	<label>ZOOM meeting number</label>
                        <input type="text" name="meeting_email" id="meeting_email" value="" style="width:150px"
                            maxLength="32" placeholder="Email option" class="form-control">
                    </div>

                    <div class="form-group">
                    	<label>meeting role</label>
                        <select id="meeting_role" class="sdk-select">
                            <option value=0>Attendee</option>
                            <option value=1>Host</option>
                            <option value=5>Assistant</option>
                        </select>
                    </div>
                    <div class="form-group">
                    	<label>meeting Global</label>
                        <select id="meeting_china" class="sdk-select">
                            <option value=0>Global</option>
                            <option value=1>China</option>
                        </select>
                    </div>
                    <div class="form-group">
                    	<label>meeting language</label>
                        <select id="meeting_lang" class="sdk-select">
                            <option value="en-US">English</option>
                            <option value="de-DE">German Deutsch</option>
                            <option value="es-ES">Spanish Español</option>
                            <option value="fr-FR">French Français</option>
                            <option value="jp-JP">Japanese 日本語</option>
                            <option value="pt-PT">Portuguese Portuguese</option>
                            <option value="ru-RU">Russian Русский</option>
                            <option value="zh-CN">Chinese 简体中文</option>
                            <option value="zh-TW">Chinese 繁体中文</option>
                            <option value="ko-KO">Korean 한국어</option>
                            <option value="vi-VN">Vietnamese Tiếng Việt</option>
                            <option value="it-IT">Italian italiano</option>
                        </select>
                    </div>

                    <input type="hidden" value="" id="copy_link_value" /> 
                    <button type="submit" class="btn btn-primary" id="join_meeting" style="margin-top: 30px;">Join</button>
                    <button type="submit" class="btn btn-primary" id="clear_all" style="margin-top: 30px; border: 1px solid #2170c1 !important; color: #2170c1 !important; background-color: #fff !important;">Clear</button>
                    <button type="button" link="" onclick="window.copyJoinLink('#copy_join_link')"
                        class="btn btn-primary" id="copy_join_link" style="margin-top: 30px; border: 1px solid #2170c1 !important; color: #2170c1 !important; background-color: #fff !important;">Copy Direct join link</button>


                </form>
            </div>
            <!--/.navbar-collapse -->
        </div>
    </nav>


    <div id="show-test-tool">
        <button type="submit" class="btn btn-primary" id="show-test-tool-btn"
            title="show or hide top test tool">Show</button>
    </div>
    <script>
        document.getElementById('show-test-tool-btn').addEventListener("click", function (e) {
            var textContent = e.target.textContent;
            if (textContent === 'Show') {
                document.getElementById('nav-tool').style.display = 'block';
                document.getElementById('show-test-tool-btn').textContent = 'Hide';
            } else {
                document.getElementById('nav-tool').style.display = 'none';
                document.getElementById('show-test-tool-btn').textContent = 'Show';
            }
        })
    </script>

    <script src="https://source.zoom.us/1.9.8/lib/vendor/react.min.js"></script>
    <script src="https://source.zoom.us/1.9.8/lib/vendor/react-dom.min.js"></script>
    <script src="https://source.zoom.us/1.9.8/lib/vendor/redux.min.js"></script>
    <script src="https://source.zoom.us/1.9.8/lib/vendor/redux-thunk.min.js"></script>
    <script src="https://source.zoom.us/1.9.8/lib/vendor/lodash.min.js"></script>
    <script src="https://source.zoom.us/zoom-meeting-1.9.8.min.js"></script>
    <script src="/resources/js/tool.js"></script>
    <script src="/resources/js/vconsole.min.js"></script>
    <script src="/resources/js/index.js"></script>

    <script>


    </script>





<%@include file="../includes/footer.jsp" %>








