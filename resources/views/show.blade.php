@extends('scaffold-interface.layouts.app')
@section('title','Show')
@section('content')

<section class="content">
    <h1>
        Show timeday
    </h1>
    <br>
    <form method = 'get' action = '{!!url("timeday")!!}'>
        <button class = 'btn btn-primary'>timeday Index</button>
    </form>
    <br>
    <table class = 'table table-bordered'>
        <thead>
            <th>Key</th>
            <th>Value</th>
        </thead>
        <tbody>
            <tr>
                <td>
                    <b><i>date_appointment : </i></b>
                </td>
                <td>{!!$timeday->date_appointment!!}</td>
            </tr>
        </tbody>
    </table>
</section>
@endsection