@extends($activeTheme. 'layouts.basic')
@section('basic')
<div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-8">
                <div class="mb-5">
                    <img class="img-fluid w-100 rounded mb-5" src="{{ URL::to('') }}/assets/images/site/blog/{{ @$site->data_info->image }}" alt="">
                    <h1 class="mb-4">{{ __(@$site->data_info->title) }}</h1>
                    <p>{!! __(@$site->data_info->description) !!}</p>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="mb-5 wow slideInUp" data-wow-delay="0.1s">
                    <div class="section-title section-title-sm position-relative pb-3 mb-4">
                        <h3 class="mb-0">@lang('Recent Post')</h3>
                    </div>
                    @foreach($allBlogData as $post)
                    <div class="d-flex rounded overflow-hidden mb-3">
                        <img class="img-fluid" src="{{ URL::to('') }}/assets/images/site/blog/{{ @$post->data_info->image }}" style="width: 100px; height: 100px; object-fit: cover;" alt="">
                        <a href="{{ route('blog.details',$post->id) }}" class="h5 fw-semi-bold d-flex align-items-center bg-light px-3 mb-0">{{ __(@$post->data_info->title) }}
                        </a>
                    </div>
                    @endforeach
                </div>
                <div class="mb-5 wow slideInUp" data-wow-delay="0.1s">
                    <img src="{{ URL::to('') }}/assets/images/site/blog/blog.jpg" alt="" class="img-fluid rounded">
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
