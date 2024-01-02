@php
    $teamContent = getSiteData('team.content',true);
    $teamElements = getSiteData('team.element',false);
@endphp
<div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
    <div class="container py-5">
        <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width: 600px;">
            <h5 class="fw-bold text-primary text-uppercase">{{ __(@$teamContent->data_info->subheading) }}</h5>
            <h1 class="mb-0">{{ __(@$teamContent->data_info->heading) }}</h1>
        </div>
        <div class="row g-5">
            @foreach($teamElements as $team)
                <div class="col-lg-4 wow slideInUp" data-wow-delay="0.3s">
                    <div class="team-item bg-light rounded overflow-hidden">
                        <div class="team-img position-relative overflow-hidden">
                            <img class="img-fluid w-100" src="{{ getImage('assets/images/site/team/'.@$team->data_info->image, '500x500') }}" alt="">
                            <div class="team-social">
                                <a class="btn btn-lg btn-primary btn-lg-square rounded" href="{{ @$team->data_info->tw }}"><i class="fab fa-twitter fw-normal"></i></a>
                                <a class="btn btn-lg btn-primary btn-lg-square rounded" href="{{ @$team->data_info->fb }}"><i class="fab fa-facebook-f fw-normal"></i></a>
                                <a class="btn btn-lg btn-primary btn-lg-square rounded" href="{{ @$team->data_info->ins }}"><i class="fab fa-instagram fw-normal"></i></a>
                                <a class="btn btn-lg btn-primary btn-lg-square rounded" href="{{ @$team->data_info->ln }}"><i class="fab fa-linkedin-in fw-normal"></i></a>
                            </div>
                        </div>
                        <div class="text-center py-4">
                            <h4 class="text-primary">{{ __(@$team->data_info->member_name) }}</h4>
                            <p class="text-uppercase m-0">{{ __(@$team->data_info->Designation) }}</p>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>
