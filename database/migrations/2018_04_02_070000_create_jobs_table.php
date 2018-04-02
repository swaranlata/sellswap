<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateJobsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('jobs', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamps();
            $table->integer('category')->nullable();
            $table->integer('subcategory')->nullable();
            $table->string('title')->nullable();
            $table->string('company_name')->nullable();
            $table->string('job_type')->nullable();
            $table->string('compensation')->nullable();
            $table->string('location')->nullable();
            $table->string('lat')->nullable();
            $table->string('long')->nullable();
            $table->text('description')->nullable();
            $table->string('applied_link')->nullable();
            $table->integer('user_id')->nullable();
            });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('jobs');
    }
}
