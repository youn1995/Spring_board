<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="RemoteMonster live media service demo">
    <meta name="author" content="Lucas Choi">

    <title>Video Config</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">
            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>
                <h3 class="h3 mb-4 text-gray-800">Video Config example</h3>
            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- Page Heading -->
                <h4 class="font-weight-bold">How to use</h4>
                <li>You can make calls by adjusting the video input, audio input, video codec, video fps, and so on.
                    (You can also change various settings)</li>
                <li>Other than setting change, usage is same as 'Call List' example.</li>
                <li>Open the same <a href="./videoConfig.html" target="_blank">page</a>on other tab or browser. Then
                    click on channel you created in the channel list.
                </li>
                <li>Source code: <a
                        href="https://github.com/RemoteMonster/web-sdk/blob/master/examples/full/videoConfig.html"
                        target="_blank">github page</a></li>
                <li class="text-danger">Please use a unique channel name.</li>
                <br>

                <!-- Content Row -->
                <div class="row">
                    <div class="col-xl-4 col-lg-5">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">Channels</h6>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <main id="lvChannel" class="text-center">
                                </main>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8 col-lg-7">
                        <div class="card shadow mb-4">
                            <!-- Card Header - Dropdown -->
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">My Channel</h6>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <main class="text-center">
                                    <video id="remoteVideo" class="remote-video center w-300 h-300" autoplay controls playsinline
                                           style="z-index:1;background: rgba(0, 0, 0, 0.5); width: 100%;"></video>
                                    <video id="localVideo"
                                           style="z-index:2;position:absolute; bottom: 50px;right:30px;width:30%;border-radius: 10px;transform: rotateY(180deg);"
                                           autoplay muted>
                                    </video>
                                    <h6 id="waitingTv" class="m-0 font-weight-bold text-primary"
                                        style="z-index:3; position: absolute;bottom: 55px;right:45px; visibility: hidden;">
                                        waiting</h6>
                                    <div class="row">
                                        <!--Video Input-->
                                        <span class="col-lg-2 mg-2">
                                            <div class="small mb-1">Video Input</div>
                                            <select id="videoInputSelect" onchange="changeVideoInputDevice()" class="custom-select custom-select-sm form-control form-control-sm"></select>
                                        </span>

                                        <!--Audio Input-->
                                        <span class="col-lg-2 mg-2">
                                            <div class="small mb-1">Audio Input</div>
                                            <select id="audioInputSelect" onchange="changeAudioInputDevice()" class="custom-select custom-select-sm form-control form-control-sm"></select>
                                        </span>

                                        <!--Video Codec-->
                                        <span class="col-lg-2 mg-2">
                                            <div class="small mb-1">Video Codec</div>
                                            <select id="videoCodecSelect" onchange="changeVideoCodec()" class="custom-select custom-select-sm form-control form-control-sm">
                                                <option value="h264">H.264</option>
                                                <option value="vp8">VP8</option>
                                                <option value="vp9">VP9</option>
                                            </select>
                                        </span>

                                        <!--Video FPS-->
                                        <span class="col-lg-2 mg-2">
                                            <div class="small mb-1">Video FPS</div>
                                            <input id="videoFPSInput" onchange="changeVideoFPS()" class="form-control-sm form-control text-center mb-4" type="text" value=25>
                                        </span>

                                    </div>

                                    <div class="mt-4 text-center">
                                        <span class="mr-2">
                                            <input id="channelNameInput" class="text-center" type="text"
                                                   placeholder="channel name" autofocus>
                                        </span>
                                        <span class="mr-2">
                                            <a id="channelBtn" href="#"
                                               class="btn btn-primary btn-user text-center">
                                                CONNECT
                                            </a>
                                        </span>
                                    </div>
                                </main>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->

           
            <!-- The webrtc adapter is required for browser compatibility -->
            <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@remotemonster/sdk/remon.min.js"></script>

            <script>
                const localVideo = document.getElementById("localVideo");
                const channelButton = document.querySelector('#channelBtn');
                const channelList = document.getElementById("lvChannel");
                const channelNameInput = document.getElementById("channelNameInput");
                const waitingTv = document.getElementById("waitingTv");
                const videoInputSelect = document.getElementById("videoInputSelect");
                const audioInputSelect = document.getElementById("audioInputSelect");
                const videoCodecSelect = document.getElementById("videoCodecSelect");
                const videoFPSInput = document.getElementById("videoFPSInput");
                let isConnected = false;
                let captured = false;
                let remon;
                let dummyRemon;
                const key = '1234567890';
                const serviceId = 'SERVICEID1';
                var waitingLoop;
                let cameraList = [];
                let micList = [];
                createDummyRemonForSearchLoop();
                startSearchLoop();

                // please register your own service key from remotemonster site.
                let config = {
                    credential: {
                        key: key,
                        serviceId: serviceId
                    },
                    view: {
                        remote: '#remoteVideo',
                        local: '#localVideo'
                    },
                    media: {
                        video: {
                            width: {max: '1280', min: '1280'},
                            height: {max: '720', min: '720'},
                            codec : 'vp8',
                            maxBandwidth: 1800,
                            frameRate: {max: 25, min: 25}
                        },
                        audio : true
                    }
                };

                const listener = {
                    onConnect(chid) {
                        console.log(`EVENT FIRED: onConnect: ${chid}`);
                    },
                    onComplete() {
                        console.log('EVENT FIRED: onComplete');
                        setViewsViaParameters('visible', false, 'hidden', 'CLOSE', 'hidden', 'visible');
                    },
                    onDisconnectChannel() {
                        // is called when other peer hang up.
                        remon.close();
                        isConnected = false;
                        setViewsViaParameters('hidden', false, 'hidden', 'CONNECT', 'visible', 'hidden');
                    },
                    onClose() {
                        // is called when remon.close() method is called.
                        console.log('EVENT FIRED: onClose');
                        remon.close();
                        isConnected = false;
                        setViewsViaParameters('hidden', false, 'hidden', 'CONNECT', 'visible', 'hidden');
                    },
                    onError(error) {
                        console.log(`EVENT FIRED: onError: ${error}`);
                    },
                    onStat(result) {
                        console.log(`EVENT FIRED: onStat: ${result}`);
                    }
                };

                function setViewsViaParameters(localVideoVisibility, runWaitLoop, waitingTvVisibility, btnText, inputVisiblility, screenShareVisibility) {
                    localVideo.style.visibility = localVideoVisibility;
                    if (runWaitLoop) {
                        waitingMsgLoop();
                    } else {
                        clearInterval(waitingLoop);
                    }
                    waitingTv.style.visibility = waitingTvVisibility;
                    channelButton.innerHTML = btnText;
                    channelNameInput.style.visibility = inputVisiblility;
                }

                function start() {
                    captured = false;
                    if (isConnected) {
                        isConnected = false;
                        setViewsViaParameters('hidden', false, 'hidden', 'CONNECT', 'visible', 'hidden');
                        remon.close();
                    } else {
                        isConnected = true;
                        setViewsViaParameters('visible', true, 'visible', 'CLOSE', 'hidden', 'visible');
                        try{
                        remon = new Remon({config, listener});
                        }catch(e){
                            console.log(config);
                        }
                        remon.connectCall(channelNameInput.value ? channelNameInput.value : getRandomId());
                    }
                }

                function getRandomId() {
                    var text = "";
                    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                    for (var i = 0; i < 5; i++)
                        text += possible.charAt(Math.floor(Math.random() * possible.length));
                    return Date.now() + "_" + text;
                }

                channelButton.addEventListener('click', (evt) => {
                    start();
                    evt.preventDefault();
                }, false);


                function createDummyRemonForSearchLoop() {
                    if (dummyRemon) dummyRemon.close();
                    let cfg = {
                        credential: {key: key, serviceId: serviceId},
                        view: {local: '#localVideo1', remote: '#remoteVideo1'},
                        media: {audio: true, video: true}
                    };
                    cfg.credential.wsurl = 'wss://signal.remotemonster.com/ws';
                    cfg.credential.resturl = 'https://signal.remotemonster.com/rest';
                    dummyRemon = new Remon({config: cfg});
                }

                function waitingMsgLoop() {
                    var numOfPoint = 0;
                    var pointStr = "";
                    waitingLoop = setInterval(async function () {
                        pointStr = "";
                        numOfPoint++;
                        if(numOfPoint === 4) numOfPoint = 0;
                        for (var i = 0; i < numOfPoint; i++) {
                            pointStr += ".";
                        }
                        waitingTv.innerText = "waiting" + pointStr;
                    }, 1000);
                }

                function startSearchLoop() {
                    setInterval(async function () {
                        dummyRemon.config.credential.serviceId = serviceId;
                        dummyRemon.config.credential.key = key;
                        var searchResult = await dummyRemon.fetchCalls();
                        while (channelList.firstChild) {
                            channelList.removeChild(channelList.firstChild);
                        }
                        searchResult.forEach((ch, i) => {
                            ch.type = 'P2P';
                            if (ch.status === 'WAIT') {
                                var btn = document.createElement("input");
                                btn.type = "button";
                                btn.name = ch.id;
                                btn.value = ch.id;
                                btn.className = "btn btn-primary btn-user btn-block text-center";
                                btn.addEventListener('click', (evt) => {
                                    channelNameInput.value = ch.id;
                                    start();
                                    evt.preventDefault();
                                }, false);

                                channelList.appendChild(btn);
                            }
                        });
                    }, 3000);
                }

                async function getDevices () {
                    var devices = await navigator.mediaDevices.enumerateDevices();
                    for (let i = 0; i < devices.length; i++) {
                        let device = devices[i];
                        if (device.kind === 'videoinput') {
                            cameraList.push({ text: device.label, id: device.deviceId })
                        } else if (device.kind === 'audioinput') {
                            micList.push({ text: device.label, id: device.deviceId })
                        }
                        // else if (device.kind === 'audiooutput') {
                        //     speakerList.push({ text: device.label, id: device.deviceId })
                        // }
                    }
                    for (let i=0; i< cameraList.length; i++){
                        const videoInputOption = document.createElement('option');
                        videoInputOption.value= cameraList[i].id;
                        videoInputOption.text = cameraList[i].text ? cameraList[i].text : ("Device " + cameraList[i].id);
                        videoInputSelect.appendChild(videoInputOption);
                    }
                    for (let i=0; i< micList.length; i++){
                        const audioInputOption = document.createElement('option');
                        audioInputOption.value= micList[i].id;
                        audioInputOption.text = micList[i].text ? micList[i].text : ("Device " + micList[i].id);
                        audioInputSelect.appendChild(audioInputOption);
                    }
                }
                function changeVideoInputDevice() {
                    config.media.video.deviceId = videoInputSelect.options[videoInputSelect.selectedIndex].value;
                }
                function changeVideoCodec() {
                    config.media.video.codec = videoCodecSelect.options[videoCodecSelect.selectedIndex].value;
                }
                function changeAudioInputDevice() {
                    remon.setAudioDevice(audioInputSelect.options[audioInputSelect.selectedIndex].value);
                }
                function changeVideoFPS() {
                    Object.assign(config.media.video, {frameRate: {max: parseInt(videoFPSInput.value, 10)}});
                }
                getDevices();
            </script>
        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; <a href='https://remotemonster.com'>RemoteMonster</a> 2020</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->
<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<script>
    $(document).ready(function () {
        $("#accordionSidebar").load("nav.html");
    });
</script>


</body>

</html>