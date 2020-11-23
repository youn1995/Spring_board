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

    <title>Simple Call</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
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
                <h3 class="h3 mb-4 text-gray-800">Simple Call example</h3>
            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h4 class="font-weight-bold">How to use</h4>
                <li>Press the "CONNECT" button.</li>
                <li>Open this <a href="./simpleCall.html" target="_blank">link</a> in another tab or a browser. Then
                    click the "CONNECT" button to connect to the current page.
                </li>
                <li>Source code: <a
                        href="https://github.com/RemoteMonster/web-sdk/blob/master/examples/full/videoCall.html"
                        target="_blank">github page</a></li>
                <br>

                <!-- Content Row -->
                <div class="row">
                    <div class="col-xl-8 col-md-8 mb-8">
                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <main>
                                    <div>
                                        <video id="remoteVideo" class="remote-video center w-300 h-300" autoplay controls playsinline
                                               style="z-index:1;background: rgba(0, 0, 0, 0.5); width: 100%;"></video>
                                        <video id="localVideo"
                                               style="z-index:2;position:absolute; bottom: 70px;right:40px;width:30%;border-radius: 50px;transform: rotateY(180deg);"
                                               autoplay muted></video>
                                    </div>
                                    <a id="channelBtn" href="#" class="btn btn-primary btn-user btn-block text-center">
                                        CONNECT
                                    </a>
                                </main>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->

            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
            <!-- The webrtc adapter is required for browser compatibility -->
            <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@remotemonster/sdk"></script>

            <script>
                const channelBtnEl = document.querySelector('#channelBtn');
                let isConnected = false;
                let remon;
                // please register your own service key from remotemonster site.
                const config = {
                    credential: {
                        key: '1234567890',
                        serviceId: 'SERVICEID1'
                    },
                    view: {
                        remote: '#remoteVideo',
                        local: '#localVideo'
                    }
                };

                const listener = {
                    onConnect(chid) {
                        console.log(`EVENT FIRED: onConnect: ${chid}`);
                    },
                    onComplete() {
                        console.log('EVENT FIRED: onComplete');
                        channelBtnEl.innerHTML = 'CLOSE';
                    },
                    onDisconnectChannel() {
                        // is called when other peer hang up.
                        remon.close();
                        isConnected = false;
                        channelBtnEl.innerHTML = 'CONNECT';
                    },
                    onClose() {
                        // is called when remon.close() method is called.
                        console.log('EVENT FIRED: onClose');
                        remon.close();
                        isConnected = false;
                        channelBtnEl.innerHTML = 'CONNECT';
                    },
                    onError(error) {
                        console.log(`EVENT FIRED: onError: ${error}`);
                    },
                    onStat(result) {
                        console.log(`EVENT FIRED: onStat: ${result}`);
                    }
                };

                function start() {
                    if (isConnected) {
                        isConnected = false;
                        channelBtnEl.innerHTML = 'CONNECT';
                        remon.close();
                    } else {
                        isConnected = true;
                        channelBtnEl.innerHTML = 'WAIT';
                        remon = new Remon({config, listener});
                        remon.connectCall('simpleRemon');
                    }
                }

                channelBtnEl.addEventListener('click', (evt) => {
                    start();
                    evt.preventDefault();
                }, false);
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