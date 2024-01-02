@php
    $counterElements = getSiteData('counter.element', false);
@endphp
<div class="container-fluid facts py-5 pt-lg-0">
    <div class="container py-5 pt-lg-0">
        <div class="row gx-0">
            @foreach ($counterElements as $counter)
                <div class="col-lg-4 wow zoomIn" data-wow-delay="0.1s">
                    <div class="@if($loop->odd) bg-primary shadow @else bg-light shadow @endif  d-flex align-items-center justify-content-center p-4" style="height: 150px;">
                        <div class="@if($loop->odd) bg-white @else bg-primary @endif d-flex align-items-center justify-content-center rounded mb-2" style="width: 60px; height: 60px;">
                            <span class="@if($loop->odd) text-primary @else text-white @endif">
                                @php echo @$counter->data_info->icon; @endphp
                            </span>
                        </div>
                        <div class="ps-4">
                            <h5 class="@if($loop->odd) text-white @else text-primary @endif mb-0">{{ __(@$counter->data_info->title) }}</h5>
                            <h1 class="@if($loop->odd) text-white @endif mb-0" data-toggle="counter-up">{{ __(@$counter->data_info->digit) }}</h1>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>

