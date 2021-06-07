<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 메인부분 섹션1 -->
    <div class="hero-wrap">
        <div class="overlay"></div>
        <div class="container-fluid">
            <div class="slider-text d-md-flex align-items-center" data-scrollax-parent="true">
                <!-- 메인 부분 텍스트 -->
                <div class="one-forth ftco-animate align-self-md-center" data-scrollax=" properties: { translateY: '70%' }">
                    <h1 class="mb-4">
                        What is How Many?
                        <!-- 애니메이션 적용된 텍스트 작성 -->
                        <strong class="typewrite" data-period="4000" data-type='[ " 인공지능 ", " 유동인구" , " 상권분석 " , " 통계 " ]'>
                            <span class="wrap"></span>
                        </strong>
                    </h1>
                    <p class="mb-md-5 mb-sm-3" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">인공지능을 통한 유동인구 조사의 자동화와 이를 통해서 다양한 서비스의 제공을 하는 애플리케이션.</p>
                    
                    <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><a href="/HowMany/howmany_main.jsp?CONTENTPAGE=/HowMany/section/howmany_section_download.jsp" class="btn btn-primary px-4 py-3">Download</a></p>
                </div>
                <!-- 메인 부분 텍스트 끝 -->
                <!-- 메인 부분 이미지 -->
                <div class="one-half align-self-md-end align-self-sm-center">
                    <div class="slider-carousel owl-carousel">
                        <div class="item">
                            <img src="#" class="img-fluid img" alt="">
                        </div>
                        <div class="item">
                            <img src="/resources/images/dashboard_full_2.png" class="img-fluid img" alt="">
                        </div>
                        <!--  
                        <div class="item">
                            <img src="/resources/images/dashboard_full_3.png" class="img-fluid img" alt="">
                        </div>
                        -->
                    </div>
                </div>
                <!-- 메인 부분 이미지 끝 -->
            </div>
        </div>
    </div>

    <!-- 메인 부분 하단 라벨-->
    <section class="ftco-section ftco-section-2">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <!-- 하단 라벨 텍스트 -->
                    <h3 class="heading-white">
                        Experience our service!
                    </h3>
                </div>
            </div>
        </div>
    </section>
    <!-- 메인 부분 하단라벨 끝-->
    <!--섹션1-->
    <section class="ftco-section ftco-services">
        <!--소개 3개 부분-->
        <div class="container">
            <div class="row justify-content-center mb-5 pb-3">
                <div class="col-md-7 text-center heading-section ftco-animate">
                    <h2 class="mb-2">당신에게 다양한 서비스를 제공합니다.</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 ftco-animate">
                    <div class="blog-entry">
                        <!-- 이 부분 이미지 수정하고 링크 수정해야함 -->
                        <a href="/HowMany/howmany_main.jsp?CONTENTPAGE=/HowMany/section/howmany_section_service.jsp" class="block-20" style="background-image: url('/resources/images/Statstics.png');">
                        </a>
                        <div class="text py-4">
                            <!-- 게시판 링크 달아야함 -->
                            <h3 class="heading"><a href="/HowMany/howmany_main.jsp?CONTENTPAGE=/HowMany/section/howmany_section_download.jsp">DownLoad</a></h3>
                            <span>애플리케이션을 다운로드하여 저희가 제공하는 통계 서비스를 이용해보세요!</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 ftco-animate">
                    <div class="blog-entry" data-aos-delay="100">
                        <!-- 이 부분 이미지 수정하고 링크 수정해야함 -->
                        <a href="/board/board_list.do" class="block-20" style="background-image: url('/resources/images/Forums.png');">
                        </a>
                        <div class="text py-4">
                            <!-- 게시판 링크 달아야함 -->
                            <h3 class="heading"><a href="/board/board_list.do">Forums</a></h3>
                            <span>홈페이지를 통해 게시판에서 다양한 정보를 교환해보세요!</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 ftco-animate">
                    <div class="blog-entry" data-aos-delay="200">
                        <!-- 이 부분 이미지 수정하고 링크 수정해야함 -->
                        <a href="/HowMany/register/howmany_register.jsp" class="block-20" style="background-image: url('/resources/images/Register.png');">
                        </a>
                        <div class="text py-4">
                            <!-- 게시판 링크 달아야함 -->
                            <h3 class="heading"><a href="/HowMany/register/howmany_register.jsp">Register</a></h3>
                            <span>저희의 회원이 되어 How Many? 의 회원들에게 제공하는 다양한 서비스를 경험해보세요!</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--소개 3개 부분 끝-->
        <!-- 통계 수치 표시할 섹션 -->
        <!-- 백 그라운드 변경 생각해야함 -->
        <section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url('/resources/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-11">
                        <div class="row">
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18 text-center">
                                    <div class="text">
                                        <!-- data-number랑 내용 -->
                                        <strong class="number" data-number="52460">52460</strong>
                                        <span>2018년 상권 정보</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18 text-center">
                                    <div class="text">
                                        <!-- data-number랑 내용 -->
                                        <strong class="number" data-number="0000">0</strong>
                                        <span>2019년 상권 정보</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18 text-center">
                                    <div class="text">
                                        <!-- data-number랑 내용 -->
                                        <strong class="number" data-number="0000">0</strong>
                                        <span>2020년 상권 정보</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                                <div class="block-18 text-center">
                                    <div class="text">
                                        <!-- data-number랑 내용 -->
                                        <strong class="number" data-number="0000">0</strong>
                                        <span>2021년 상권 정보</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- 통계 수치 표시할 섹션 -->
        <!-- 큰 소개 부분 -->
        <div class="container-wrap mt-5">
            <div class="row d-flex no-gutters">
                <!-- 이미지랑 내용 -->
                <div class="col-md-6 img ftco-animate" style="background-image: url('/resources/images/About.png');">
                </div>
                <div class="col-md-6 d-flex">
                    <div class="services-wrap">
                        <div class="heading-section mb-5 ftco-animate">
                            <h2 class="mb-2">Our Service Keeps you Happy</h2>
                            <span class="subheading">How Many?는 이런 서비스입니다!</span>
                        </div>
                        <div class="list-services d-flex ftco-animate">
                            <div class="icon d-flex justify-content-center align-items-center">
                                <img src="/resources/images/s-icon.png"></img>
                            </div>
                            <div class="text">
                                <h3>빅 데이터 기반 통계</h3>
                                <p>빅 데이터를 이용하여 정확하게 통계를낸 정보로 다른 업주 보다 더 유리한 지역을 선점하세요!</p>
                            </div>
                        </div>
                        <div class="list-services d-flex ftco-animate">
                            <div class="icon d-flex justify-content-center align-items-center">
                                <img src="/resources/images/s-icon.png"></img>
                            </div>
                            <div class="text">
                                <h3>실시간 데이터 반영</h3>
                                <p>실시간으로 반영되는 데이터로 다른 업주보다 더 빠르게 정보를 습득하고 준비하세요!</p>
                            </div>
                        </div>
                        <div class="list-services d-flex ftco-animate">
                            <div class="icon d-flex justify-content-center align-items-center">
                                <img src="/resources/images/s-icon.png"></img>
                            </div>
                            <div class="text">
                                <h3>다양한 접속 환경</h3>
                                <p>PC만이 아닌 모바일 어플리케이션으로 접속하여 모바일 환경에서 제공하는 다양한 서비스도 누려보세요!</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 큰 소개 부분 끝 -->
    </section>
    <!--섹션1 끝-->