Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987061;
	b=hRyubR9L5nG+xtP3/dY26GD+RJHjknL4Qaqv2uLiCUQHfA7UbshXDYJybr9+fd9bZtRh
	 E2fNgO1YeNOoLzT8kJPZ2O0rINOYMsScgQllnaJafayrrfvZ60AqrRa681+DAto0DVvAh
	 +j/sSMe4MrFT2t9Q+wq88kzZkl6yqWChTazHjA/NWlvmwY8QZNxNVQTxaDNI5PoQX0Sln
	 /E4IDssd6v/TUHv/Y7iC0U1giq/gHh5bEP22n9slQWVHqT0kEOzglF753cC6UOLxDqA7v
	 QffE9mlRhJcvdEMmNS6q119lwVK/ATIWTdkK0BsPbSidv+05qFNkPRa3f00FZRMk05g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987061;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=Onkdzx3Fmjrh6uXG/Bgn692UBKcbOofx73jEESykt5k=;
	b=suBKHKZyJ5f6kdmafHLX3sgfS/mnU8MMLTma9leRDrbjIrVbzx5kY/8hVt5/ljE4tb8W
	 geKC3VpVV+EMg2KSbD00PS7B8ByLWQa4MihqsIoLlAXFiQMYu6OKUHq2Cjt4S2fq1tT6c
	 jErgZEYlTjx+LivFDta2HP2KZSfUNTbGnAwRuJeBtxW9TjczWZFjGOupaPblcJG09or7b
	 yeutFKbv+bcTZqTDhK9SGejFTk7dZ7LscTtooQUfhHGC9shXcBP3rDxPljXYR4K5dckK8
	 GZ1PN+GTGwrcT3dEElGKmG4GjkLRRBDb6vaRFHh7Yuc1ku4yJ3DezQmwQllObKHzL8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NVR5Yt8d;
	arc=none smtp.remote-ip=95.215.58.116
Received: from mta1.migadu.com (out-116.mta1.migadu.com [95.215.58.116])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E44606A326
	for <linux-wireless@vger.kernel.org>; Fri,  6 Nov 2026 17:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1E44606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NVR5Yt8d
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Onkdzx3Fmjrh6uXG/Bgn692UBKcbOofx73jEESykt5k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793987057; v=1; x=1794591857;
 b=NVR5Yt8d6PDwzcWMSB0onMjFstm9BqGFWLq1dHtIZ04pH7t5IWpOKa+51gpkANU8xgLumsmP
 lrIWB/vKtqnAFMDCGBE+jQtew4b942sMa99lfdrSaN+uNYbrts+JEJOO0Tq+baZPWTAddIVYh6Z
 UyGqwAR9VA0S1/x1wt6IbunA=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id de368be1321a3cf4;
	Fri, 06 Nov 2026 17:44:16 +0000
X-Mizu-Trace-ID: de368be1321a3cf4
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 17:44:16 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <cf3ac5de969de93866dc9221521443608bae307d@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next v2 0/7] wifi: rtw88: extend 88xxA support
To: "Ho Jie Feng" <hjf3108@gmail.com>, "Ping-Ke Shih" <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, "Ho Jie Feng" <hjf3108@gmail.com>
In-Reply-To: <20261031070950.425176-1-hjf3108@gmail.com>
References: <20261031070950.425176-1-hjf3108@gmail.com>

Hi Jie Feng,

Thanks for the v2. I have a couple of comments for cover letter.

October 31, 2026 at 8:09 AM, "Ho Jie Feng" <hjf3108@gmail.com> wrote:

> This series enables HT STBC transmission, VHT SU beamformed reception,
> carrier-frequency-offset correction and adaptivity on supported
> 88xxA devices.

There is no changelog since v1. Could you add one to the cover letter
in v3, with what changed in new version and a link to the previous
one? It makes it easier for reviewers to quickly regain context and
makes it easier to track changes across versions.

> Tested on RTL8812AU together with the driver-frame series.
> TX went from 136.0 to 144.2.
> RX went from 215.5 to 249.2.

If the series you tested with is the one that became 62e69ef45567
("wifi: rtw88: usb: don't report the aggregation buffer as a frame"),
it is in rtw-next now, so for v3 testing on plain rtw-next should be
enough.

[ ... ]

> base-commit: 9b0be45d4d52fd223994e151f169743a97abd290

v2 no longer applies to rtw-next. ec2baa4c9317 ("wifi: rtw88: Pass the
physical map to the read_efuse chip op") went in after you posted it and
changed the rtw88xxa_read_efuse() line next to the new code in patch 2,
so v3 needs a rebase. After fixing that one conflict the rest applied
for me.

Best regards,
Luka Gejak
