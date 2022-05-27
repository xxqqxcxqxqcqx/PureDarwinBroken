/*
 * CDDL HEADER START
 *
 * The contents of this file are subject to the terms of the
 * Common Development and Distribution License (the "License").
 * You may not use this file except in compliance with the License.
 *
 * You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
 * or http://www.opensolaris.org/os/licensing.
 * See the License for the specific language governing permissions
 * and limitations under the License.
 *
 * When distributing Covered Code, include this CDDL HEADER in each
 * file and include the License file at usr/src/OPENSOLARIS.LICENSE.
 * If applicable, add the following below this CDDL HEADER, with the
 * fields enclosed by brackets "[]" replaced with your own identifying
 * information: Portions Copyright [yyyy] [name of copyright owner]
 *
 * CDDL HEADER END
 */

/*
 * Copyright 2006 Sun Microsystems, Inc.  All rights reserved.
 * Use is subject to license terms.
 */

/*
 * ASSERTION:
 * When xlate is used on a variable for which no translation exists a
 * D_XLATE_NONE is thrown
 *
 * SECTION: Translators/Translate Operator
 *
 *
 */

#pragma D option quiet

struct myinput_struct {
	int i;
	char c;
};

struct myoutput_struct {
	int myi;
	char myc;
};

translator struct myoutput_struct < struct myinput_struct *ivar >
{
	myi = ((struct myinput_struct *) ivar)->i;
	myc = ((struct myinput_struct *) ivar)->c;

};

struct myinput_struct f;
BEGIN
{
	f.i = 10;
	f.c = 'c';

	xlate < struct myoutput_struct >(f)->myi;
	printf("Translate operator used without correct translator decl\n");
	exit(0);
}

ERROR
{
	exit(0);
}