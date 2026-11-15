Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757433;
	b=TYvIfDyLxAsX2BueLEqSgDuOk3EbzFY5NtLZ7suBjQ3bVifEPEbyXPvX9aYuzxj1H0yC
	 rGkOVAoGY0ndjBKtaCPM2D18jcyEmRlIBvKIkq4f9thMY1wWbhQQAJXWQ428IAuizSCpO
	 dHKcIklyjxuZ0DdgwzW7a9/IBM96YwOlWOawatmkucdVUtJeV65Oqg2hrc/C5HRM4JX93
	 FqrU/2nXZjOpj0mUMOwCjJqof5y4xrtiNL7T7mbmFgGGEiLYOybZChgWj8pxMwqsblg7I
	 3C02EHzVc6SxOjCy/frlyTox0gXwhVYW/y9EFcK4jTn/ZXQ65arfHi74TqtLcyW1r/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aQeEqSqLx+Kp/30sy6eZjaTFG/cEmbiqOE4nLKGI28I=;
	b=plbdF+NuSh9Q/dYajxubkwXbIyy/AlBabKF6VggRr0WJYfL1TJ4Pg9GzdlxEmqus621y
	 9BKxaGf49GXJkwC1C2vKyVYt5Z4WdCCvkdCeCWOBVAK8QLlxILOtEZb21MXkoZmMP4Jkl
	 qqMt7YdtQ/oLFgJBJ1UAd2wQtbWRtY5H0H6lN5TdmXcaBvVknTVhbzRnA+AsElroON/lr
	 tvpPSuvC/YPhOSXsAkGlD2O4vg+iXDpT2gMlkvxrGj6RCcXMsLI+YJuyVoMykm6B9a4m7
	 vC03ndLnLaqKShf1qMJz58iVecvpfg/Dovo3ccwlgfEjGXxG8jyXyorcvOEOSGQFf2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LQW6XtIt;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4DC606A32D
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 15:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E4DC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LQW6XtIt
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3282db206d3so7844286eec.0
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 07:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794757432; x=1795362232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQeEqSqLx+Kp/30sy6eZjaTFG/cEmbiqOE4nLKGI28I=;
        b=LQW6XtItJ3Y5xPLhFo4UcMi12xncRFb02s8hw5IpcQ4UQYFYH5ckAqv1dyx9T45lRW
         ZSNu2rnDwQZZDoBw2S1DuVj5B+W3BMG/jSTBz0iqnMtWJ2grChQ/hDUujfF3VyNMkJiE
         GD7U0TitCUXks1hTSWoQNdLJz8/mNviTk8+fR7/sLu/99e+PVejqdqkTztOnhhorX775
         2sbrCiQlBanwrSNt9xPx2UkS3miIbm7iRRG0tqJ8K7OOwV+N5RfG3PE+yZ8KkcLiD4JG
         Y7HwRMPheKpvy1EtWFxEGz/5i5hff3BLjzfN604qCOAiZnFEc/sV9hRA6LNpQ+33HiDy
         BAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757432; x=1795362232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aQeEqSqLx+Kp/30sy6eZjaTFG/cEmbiqOE4nLKGI28I=;
        b=vmmsqLHkqBDdEkBPqOskOeti9dgHX+WcMkodcyVMsPX2r8DvKwi5PT913VhKAv+wGz
         Wlt3sYRWU74rzD9T6HcgyFagDQvs332Y74cFQ5p3e86p8r3DoMEaUUzzTcg34XTz7nvT
         PCNGf6gxux+Ji6DsoDo47e07SlVjXQvh9AtrDHWGTMqeOQeeU1D+aps6xsNSxfqwEBGA
         S6m5CQWXvjjj4qazYnyXyPv8aPXxQMzBh2n+bMsiJpbVxoWgle1QqqsmWTQj7wX+J41s
         LxKpqafMo+b3/XbI1rJVR8zLEpiucIUrZDIi09X59Y3tV6HWYCVC5FAhxwFRKep+uCPE
         VdYQ==
X-Gm-Message-State: APuU4Z906jXit2VBTquhwaP0QOfYBZQEWHD/kSQVCpZBlt0vzlnTmEwc
	j3p18zdkLTPTFeKicvJhox5H9WfHBdpRjgwiSiS40Tj6uBUGe/WZVcFemLvAkpB4Jbw=
X-Gm-Gg: AYBFou2zu5v/L7PArvUjnKzt939BU1u6ZN4woFxmiAdd5W+uphRa/TjjbXS4+QZls68
	02gBcwsoL0Ozxhyzo5RGF/7J4BbG0snUTOZDf8H9njIwJAMRMXX+VtQTAYhrAp5WjZ1c+/hW6qM
	tvc5x3lhDUM1sb5rBKlFU++tGpFYVIcOtKv1hP/vOfoBiYOyuFR13/DP36brKKy2nvq0CJYhoNL
	8p9Uy0jqk4VTOV72WS2Yh0CoTMaDbnTEbg4Ag6XqWO2vcjGhZZHNipRIWJauSqrSbWUZFGAibuq
	Wddh2wxKSFDUKEORr8UsTCvQGVHOSD1myA4pxJGoZJh+vIhU4ciR5mM/EENySYmlwwVcxpAwawS
	5cN0gvaw67szHPnx0Xie0c7Xvtj1umi78xNsvmOWLZWjXzdkvaQAf0FOM2pXszch6nyq735EXfg
	l4HOe9aZWOcUO3lpUb565O0fH89hgimlf8Y92qb49vELqx4uFKQ5hjxeApJsqooYHkXT8aGmEd4
	6XwB8Fw+UBu3cQ9Ik6I1wcl1IxMr6V2qA3/DXIlnZR/mE0eduwxGDYG19IdvlH68psgOxnI9TAm
	y8OXKYDxfore5cq0e+/ajedf+rmj5rsMHUn7Qcqit/rt4zEkQJKQsj9ADu9f
X-Received: by 2002:a05:7301:52c5:b0:36c:a281:1bc with SMTP id 5a478bee46e88-37966a5ba74mr8291604eec.16.1794757431228;
        Sun, 15 Nov 2026 07:43:51 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:d1be:2710:af83:9beb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm26224242eec.13.2026.11.15.07.43.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 07:43:49 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless v2] wifi: mac80211: parse wrapper TPE elements without an extension offset
Date: Sun, 15 Nov 2026 23:43:21 +0800
Message-ID: <20261115154321.78691-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <CACHPgzyxGEYJVCyGH6GJBvUdqG8zsfyRn5zxDiuj14tw3byXBw@mail.gmail.com>
References: <CACHPgzyxGEYJVCyGH6GJBvUdqG8zsfyRn5zxDiuj14tw3byXBw@mail.gmail.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please do not apply either v1 or v2.

An agent used a Gmail connector to send emails during read-only review. It
sent v1 through that connector, then sent v2 without authorization. Gmail
line-wrapped both diffs, so neither public revision applies. Please treat
both messages as invalid.

A clean v3 will follow through git send-email.

Thanks,
Zhao
