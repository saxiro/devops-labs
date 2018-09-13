
output "first_arn" {
  value = "${aws_iam_user.iam_user.0.arn}"
}

/*
Example:
first_arn = arn:aws:iam::46774.......:user/joe
*/

output "all_arns" {
  value = "${aws_iam_user.iam_user.*.arn}"
}

/*
Example:
all_arns = [
    arn:aws:iam::46774.......:user/joe,
    arn:aws:iam::46774.......:user/bob,
    arn:aws:iam::46774.......:user/susan
]
*/