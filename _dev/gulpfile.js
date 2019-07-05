var gulp = require('gulp');
var sass = require('gulp-sass');
var sourcemaps = require('gulp-sourcemaps');
var replace = require('gulp-replace');
var autoprefixer = require('gulp-autoprefixer');
<<<<<<< HEAD
=======
// var imagemin = require('gulp-imagemin');
 
// gulp.task('optimize',function(){
//     return gulp.src('img/**/*')
//         .pipe(imagemin())
//         .pipe(gulp.dest('../assets/img/'))
// })
>>>>>>> 69e62a512c76de44444416e7e84b9b776698aa37

gulp.task('sass',function(){
    return gulp.src('css/theme.scss')
        .pipe(sourcemaps.init())
        .pipe(sass({outputStyle: 'compressed'}).on('error', sass.logError))
        .pipe(autoprefixer({
<<<<<<< HEAD
            browsers: ['last 2 versions'],
=======
            // browsers: ['last 2 versions'],
>>>>>>> 69e62a512c76de44444416e7e84b9b776698aa37
            cascade: false
        }))
        .pipe(sourcemaps.write('./maps'))
        .pipe(replace("~material-design-icons/iconfont/", "../css/"))
        .pipe(gulp.dest('../assets/css'));
})

gulp.task('move',function(){
    return gulp.src('img/**/*')
        .pipe(gulp.dest('../assets/img/'));
});

gulp.task('watch', function(){
    gulp.watch('css/**/*.scss', gulp.series('sass','move'))
<<<<<<< HEAD
});
=======

});
>>>>>>> 69e62a512c76de44444416e7e84b9b776698aa37
