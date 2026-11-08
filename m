Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794161538;
	b=ZPr1LRxJBM4S71dWaTuGnbtdQaMUvfN50Dy5CN/YJHSPt0UJnzpXipbRulu6l00Jp+L0
	 l7si1xY0zMi3DQXpnNFkhbiQkBTsQgumbNCXByXYGHZriXWXSqo7rnr8nH6EfWsiMVg+H
	 VdMdtbDL/s0K/H/ZPc0ISA1ghyxnB9urirG8ryTNwbD/3a8eH966toZZzclPu1U3WkYyL
	 PM8DcJHifMp/Oq0jBp+5kLprqodajQ4uGnqEpWibZr8euJFo3pgO6nP1uUp8fgyo4DGFP
	 VPpLUb3idAgvbyVqmfzvV9xrWw06hWw3iQK8l3cKdDwYLAKo1z7qSgXkmnKzM5rMDLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794161538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=mf6qS54xT/o4qhvSdAqVzjNkyCPGUffKHoXAyP7av4Q=;
	b=WRbJ09gT5QDLkZVYrsrFPa5G0tde79xUcivVatWtX7r466KxD35xW0IUxeGGk8tyF3Hl
	 YN333TDLyCzl6ic74Zj+p6k3M+3/wph4s0KJmpeaV0byi/xc50Be/7JZV8iNoIX7VZEim
	 9650AkCSK9EJ5/ljMD1mr5H75MG2dQPdq91+d0T4LBK+Ysi5pKiWsPd257GtA8Uo5euw7
	 dYMlWmMX/D8LCJeQWzIasCkCxQmgCDZtz843psdDGnmazhiZWF7F/uc19zRNMJ9j3KXhx
	 TLyit7BC8ZfTrIzVVGUCXuzklBI3WIj5O9t07OEmQm/30A3o6kKZhCqYEOqSjoaKEkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U3KV6yZu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AAD606A320
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 18:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1AAD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U3KV6yZu
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6f5a0893610so132318eaf.1
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 10:12:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794161537; cv=none;
        d=google.com; s=arc-20260327;
        b=dzLGioLjYdgfhN6lxsxAlDzOhQD3SectkONih321M6CGKwSquhJ7rSqEpTgw17aD/R
         q6AJcCbItBFsBd/+GPEEs3nHpqDOgNUXkT3Gss9mjWole5SDb3yNipO+MJr2iiYAs3pw
         h1Ul9zx1yw8BRaWQd8iWNDPJuWkppKEVSqSAhBqerhaASCl36c6Oc8PzxJH4r9UC6MNu
         QmpFsc1I6fJmXb/p7KXCHPXwX8vcILmVEa0XpDZreMXKOgr105OVDZmb7IfIB4KmbVug
         8suUrV+I5Qmomsh+qe9vVOzQJsfL3tOgV/0X0Q9BaouM/7qnNLUND8ORN8XcIIR70stG
         3YpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mf6qS54xT/o4qhvSdAqVzjNkyCPGUffKHoXAyP7av4Q=;
        fh=9SKooS7Xh0GP2ZXb44mApRJQgiMw5tYrdvl4iuXS9XY=;
        b=SfKOt68vk9v467BUbFq6wsMXDO/XgqnDM/2P96XxuS9RyIyBsRQZFI49vzo+hMmYIq
         wd5oHKmtnydLsTGh2CdTxQqH99St0RIXaoq3OxkeY8U83FuG4m/P4Xk7pJsR6AyBz9VA
         GgN4nsW1KCM1AsL8XR9iexlDqSRKicOmRKTBNVCfHF3dA8soDLKX2RolHb2w4Z5OuazJ
         t24wGHr+zys0OzD5gKhpJrquqtH+SuYY6H3ca2WggSn5Df6OPYmb1MQKxv59w9XC6fsc
         jPAFpqODRCO28oFn4LbrBm5Q4u55jnpCqyaMXd/5IWPG17MmDzxCkZVR6GkOKp2jKEdB
         yTyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794161537; x=1794766337; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mf6qS54xT/o4qhvSdAqVzjNkyCPGUffKHoXAyP7av4Q=;
        b=U3KV6yZuvrfhplGszqQWOjzBAQln51W1zwD09sz38Ti7j90ly73KGAy8soO0Ua1PvN
         ucL2DFySM+uyRnuxLsB2r0GzIum825XpUhfeOS/jSa0qvJJbc3CUmZGgkontj3IJhvA0
         HJC4NSAd5MyCvDIUOnfhygA9XyGLd+fd4GgylK9Vr0z6PUkJmI6+CjojJ3Iz8sWC25tY
         dkKFHMONmdAP39BmsOH5P4o7vvMDJCWPIL7k3EMOkJNvGdbBZbHc2eAt9nGc94DOv+7r
         iUuH8Uh/jFpIcY5PtdMS22krb+RfM0xLckEvdKjEwjQZKzhklyGxlPL6lqqdSCA6hck2
         VfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794161537; x=1794766337;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mf6qS54xT/o4qhvSdAqVzjNkyCPGUffKHoXAyP7av4Q=;
        b=WMEUJb4/Gy7i8neKJhLaOy2VLOqckCKB4dLTaxaeR3Mnse4nm6uhMmwY626zlKdxY+
         5cBUDgT488qAdzmz008ZtTqjfEsWnCy6PkBZ/coG1ffHaVqPYHhS7U4b4TgSGzebcdYv
         EJgwSVxUSLeHoll8FOz8os3NshLeamnwXldUo1hPLPydTL7Y6y/3z0Eukm0RAanCqvY1
         rJ+d8SnLLtxQUqaOmXruqHhZ9DbwdDYFF3dkuV28h3/WL9tF1HdsKPk4rg3ErKRcCDiu
         d02FO6sC/05dRwokb797yZh20XHPVh4eT1XC2Ij/wCEbuPlf5tx47H8V8f1d9jsnfbej
         LtwQ==
X-Gm-Message-State: APuU4Z/FA0dA80rK4Kg+iwBltj2eUGMtKircTscpyrsR9QXiqOMzkPVV
	W1JpgvMY/UAEo5c+bGQ2Df5Zzxtc5cPSlpHgAAvHs9+fkbow1i0gAue3NWSGekRXTo4MscDGlwa
	56Xx2loCByyd5+3nRCCUl0TrbmO/aZNE=
X-Gm-Gg: AYBFou2DhokK2lofwrT3arGebsjOMUUgmpkWrazmscvw71vqX/z1cFVGdBdM8jCB8CF
	vpQY0w7kGhVYZA1QjDhR9aLIB3bEoZE1rK9i7ogKroly84oYhJMZ5jm3xiUiFCpAwhWyIuUr4M7
	6NlYkB6M1a+cWpNJd0YeI+nR3dV0BsC5oJEoVA7ebtTepNGOkrnqt3mFBwn4r1j2bA3pl1DivD1
	mBl3XJmTgsMoimi+gK+tH76OeOJrxzlsntX2V2rTAYMPhvcmF67Y79/XkfY5ahXs6ambLASSUk7
	acsasVAGPsEqw3bVikYHL12htxuJko6Y7eJPG4pOFzOfT3kiRP5A51OAsI1/Qf+gyyLKsBrs5na
	gXMwrY9S8FM3JUsPll8HiTajOLC+ClcncoF604WHDUYqsr+OUexmA3BjaT7HqmQnUxpdq
X-Received: by 2002:a05:6820:619:b0:717:866:abef with SMTP id
 006d021491bc7-7170f278d4bmr1136117eaf.34.1794161536841; Sun, 08 Nov 2026
 10:12:16 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103095256.949327-1-hjf3108@gmail.com> <20261103095256.949327-2-hjf3108@gmail.com>
 <e4895ae4df0e4de6a5dc45bc276cb1d1@realtek.com>
In-Reply-To: <e4895ae4df0e4de6a5dc45bc276cb1d1@realtek.com>
From: Jie Feng <hjf3108@gmail.com>
Date: Mon, 9 Nov 2026 01:11:39 +0700
X-Gm-Features: AclHuK_9BKwFyW47YiDHeQyFozoiiX3cmNycuz7EuLCuXtAhC-TUMK7iBw7jXso
Message-ID: <CABOQOSWgd5hyvZj4tcSwYHD2_n3Su1hBGkBRo3AYvvRmPijeYw@mail.gmail.com>
Subject: Re: [PATCH rtw-next 1/5] wifi: rtlwifi: rc: start no BA session for
 QoS null frames
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	Bitterblue Smith <rtl8821cerfe2@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 8 Nov 2026 at 11:08, Ping-Ke Shih <pkshih@realtek.com> wrote:
>
> Ho Jie Feng <hjf3108@gmail.com> wrote:
> > Only start BA sessions for frames that carry data.
>
> I can't understand why building a BA session for null frames cause lower
> throughput? Please explain why.
I included the throughput numbers as a regression test, to show that it does not
cause any speed regressions. It should not affect throughput.

> >
> > Test results (2.4 GHz):
> >    before after
> > TX 7.0    6.1
> > RX 28.3   29.1
> >
> > Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
>
>
