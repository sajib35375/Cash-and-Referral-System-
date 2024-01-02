@extends('admin.layouts.master')

@section('master')
    <div class="row">
        <div class="col-xxl">
            <div class="card">
                <div class="card-body table-responsive text-nowrap">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>@lang('Email')</th>
                                <th>@lang('Name')</th>
                                <th>@lang('Status')</th>
                                <th>@lang('Contacted At')</th>
                                <th>@lang('Actions')</th>
                            </tr>
                        </thead>
                        <tbody class="table-border-bottom-0">
                            @forelse ($contacts as $contact)
                                <tr>
                                    <td>{{ $contact->email }}</td>
                                    <td>{{ $contact->name }}</td>
                                    <td>
                                        @if ($contact->status)
                                            <span class="badge bg-label-success">@lang('Answered')</span>
                                        @else
                                            <span class="badge bg-label-warning">@lang('Unanswered')</span>
                                        @endif
                                    </td>
                                    <td>{{ showDateTime($contact->created_at) }}</td>
                                    <td>
                                        <div>
                                            @if ($contact->status)
                                                <button class="btn btn-sm rounded-pill btn-label-warning decisionBtn" data-question="@lang('Are you confirming to mark this contact as unanswered?')" data-action="{{ route('admin.contact.status', $contact->id) }}">
                                                    <span class="tf-icons las la-ban me-1"></span>
                                                    @lang('Unanswered')
                                                </button>
                                            @else
                                                <button class="btn btn-sm rounded-pill btn-label-primary decisionBtn" data-question="@lang('Are you confirming to mark this contact as answered?')" data-action="{{ route('admin.contact.status', $contact->id) }}">
                                                    <span class="tf-icons las la-check-circle me-1"></span>
                                                    @lang('Answered')
                                                </button>
                                            @endif
    
                                            <button type="button" class="btn btn-sm rounded-pill btn-label-danger decisionBtn" data-question="@lang('Are you confirming the removal of this contact?')" data-action="{{ route('admin.contact.remove', $contact->id) }}">
                                                <span class="tf-icons las la-trash me-1"></span> @lang('Delete')
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="100%" class="text-center">{{ __($emptyMessage) }}</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>

                @if ($contacts->hasPages())
                    <div class="card-footer pagination justify-content-center">
                        {{ paginateLinks($contacts) }}
                    </div>
                @endif
            </div>
        </div>
    </div>

    <x-decisionModal />
@endsection

@push('breadcrumb')
    <x-searchForm placeholder="Email" dateSearch="yes" />
@endpush
