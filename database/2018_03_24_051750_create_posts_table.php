<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePostsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('posts', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamps();
            $table->string('title')->nullable();
            $table->string('user_id');
            $table->text('description')->nullable();
            $table->integer('category')->nullable();
            $table->integer('subcategory')->nullable();
            $table->float('price')->nullable();
            $table->string('location')->nullable();
            $table->string('lat')->nullable();
            $table->string('long')->nullable();
            $table->string('youtube_link')->nullable();
            });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('posts');
    }
}
