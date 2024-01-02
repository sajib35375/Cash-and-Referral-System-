@php
    $chooseContent  = getSiteData('choose.content',true, null, true);
    $chooseElements = getSiteData('choose.element',false,null,false);
@endphp
<div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
    <div class="container py-5">
        <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width: 600px;">
            <h5 class="fw-bold text-primary text-uppercase">{{ __(@$chooseContent->data_info->heading) }}</h5>
            <h1 class="mb-0">{{ __(@$chooseContent->data_info->sub_heading) }}</h1>
        </div>
        <div class="row g-5">
            <div class="col-lg-4">
                <div class="row g-5">
                    @foreach($chooseElements as $choose)
                        @if($loop->odd)
                    <div class="col-12 wow zoomIn" data-wow-delay="0.2s">
                        <div class="bg-primary rounded d-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px;">
                            @php echo @$choose->data_info->icon; @endphp
                        </div>
                        <h4>{{ __(@$choose->data_info->title) }}</h4>
                        <p class="mb-0">{{ __(@$choose->data_info->details) }}</p>
                    </div>
                        @endif
                    @endforeach
                </div>
            </div>
            <div class="col-lg-4  wow zoomIn" data-wow-delay="0.9s" style="min-height: 350px;">
                <div class="position-relative h-100">
                    <img class="position-absolute w-100 h-100 rounded wow zoomIn" data-wow-delay="0.1s" src="{{ getImage('assets/images/site/choose/'.@$chooseContent->data_info->image, '800x800') }}" style="object-fit: cover;">
                </div>
            </div>
            <div class="col-lg-4">
                <div class="row g-5">
                    @foreach($chooseElements as $choose)
                        @if($loop->even)
                        <div class="col-12 wow zoomIn" data-wow-delay="0.4s">
                        <div class="bg-primary rounded d-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px;">
                            @php echo @$choose->data_info->icon; @endphp
                        </div>
                        <h4>{{ __(@$choose->data_info->title) }}</h4>
                        <p class="mb-0">{{ __(@$choose->data_info->details) }}</p>
                    </div>
                       @endif
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>
