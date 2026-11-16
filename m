Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826836;
	b=fDys684ScSl5zxdvppQkFIyRsjiPDrpIwpZFiEGM/coIFh4cma3di090QyLGmNkuxN58
	 UOMOWNNhaELkHSfFyk6MUbAJPljX3TaBApEGIANJOZQbpPea0LM4qi6Oz91hdbCp4+Z+f
	 B8Ub3mgERA41rMgJJ9fP+DdGKCz3O9S1GUn03YBPy3d9rxvqhFEOW0jHPKM0FBEdq4MQv
	 jZgQXi1MMdCmG+QQoy9/2YbEXzWB/BBWZQRrcVaLpJg8i4oleiFCKyQLQxug5RwZCMriZ
	 EFoAG3ySBYWaMVSFFVMC+y7kSDfsLPwpaQ/4Yx1ZuFu4qzTTQv56Ewf+GxkClBez+JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=PoGuIV2CW1MyjUCqGaI+U1vpCobn5gb5K6UIl8jT3Vw=;
	b=cKsmSVzxItsSsnEAQMzinpp4bluyatu1dudZX3bxqCg7kgHPsNTqQ4iUd3WOos4bbz33
	 xKx99+Ch2zRcHHfX6HPqmMN94Pc6mvvTlsM+WfFzmwaarClOExwamTaweU3fA+zdIFsm5
	 S4Vuxp5a8IRWtLOXiZH/SbuVNW2PfX03aTPB3kGwm8FU+9++5ZVtzTYqjrleHPLPHw6DL
	 WevFHrpOLUqlgrEmoUGZnZ2XKdXt2UXp7N0OlIdQpaadm27t/8Fko5vsAFca3ns4w21DG
	 wK5V3rfhCiPTlxN/8rSAUNchKRRkK4KYg963DGgjHPGSY7Ze2kGh1eJ1Pe9etm67bzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vzR4NcZO;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62378606A330
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 11:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62378606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vzR4NcZO
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491971ac844so2900083f8f.2
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 03:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826835; x=1795431635; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PoGuIV2CW1MyjUCqGaI+U1vpCobn5gb5K6UIl8jT3Vw=;
        b=vzR4NcZO6Ppt8IQ80moaMSyoWpeBFnbXtj109DRiSO4QSMu0X/iQfQd5eRpxYPpAXZ
         ns4sy5TS4s9x9J1cSKcuz+pgopbzYCq/SVEvfhOJUQnpJRKvmGKP8VWFcZyVJuzP0xic
         upk+PALWfKhTpc+a+CcMLdROYgbalxMLNR+WjfNggHsQKF1dpS/rL/zw2PDxihGiqbXb
         p8uJbGDXgnr3XaekBDtyJkNoHuG9vDnHGQZwIhNNEJ7kzpaU2QjdpL4Xgyd1DWDL8V0N
         ThsqOr2CCyiZfYRrMZ2MCpPVu7ZGuyh3ROOQ9t9iDyD+xkJeIXfOrSWr60NhNFkG7mJ/
         TDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826835; x=1795431635;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PoGuIV2CW1MyjUCqGaI+U1vpCobn5gb5K6UIl8jT3Vw=;
        b=LSrgmDylh1pMTdR8CiN+R5FUhOTkNnZXA83pIbzZGmnnVWHIoBMJuyrhc5OzJOLH0Z
         al76k2Lk4m4jJCqwXQ65ve7UAz2j4qmQk5dIwbtHHCx8bW+9fgl3CFmUcVuhsVWMHb/w
         VOdyn7tyJXG9ydhVS/u3Trcd4ok6mO5/nTxcinKSZgeRDh42w7l+jl3UoWrZI98LqAYK
         S6a19w2QOyK3mf7Foa3T2fbl2LteMmaeKWCjNKowY0aaehMH/1eHdd2h3KG1cYDj5Xai
         xrkiSd/CuatFCr8XAd5C25GNmEnTjlUGU8UEeSvzkx/AV+5KkgCo/OrHplDsiGW8O7bc
         CxtQ==
X-Forwarded-Encrypted: i=1; AL+hErH2giBqgrnoSqyu+bTNusv56I7MmzJ5qgQCIqm5v9wQwjwRcmQG10LA6en+gz6L5mAUPaY9WvlQvtJt2nnlXQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/lTx9ITLeS3/0VooKp728Hsw8XRWg5OG4o0YospFItOwVAf+mL
	nW11paYe35QI7aFaOpreGv4P1nJ4PYo+YTGkozM5NMT8PApznWh/dtqJ
X-Gm-Gg: AYBFou2cgQmYNM/tf11/7Smf8x47PbgBaUilNIXB9mnqpjQzvZ+G4Dn2bqejQCCNJtb
	z4I3nS4YQy2RDCPkx8oAmaaNfXBJxD5tmiuqZVPHQld97zIu1y6UuGxVmgL6C5sISmOZkSyMG0L
	P47ZimaRyWZio55CD1w/AqA57tRN8hiB0Dpm5p5hmUZAPcWYIiXphtzEPqr02WxCjbks+TayTdt
	hL/aykPvw+IZkXpLCmKePXqnNyxUcj0fwbK7S6IVEPU5fx8fsS/hvQXZaHwyXlxo11Roo3sAiLz
	2XSFWA2VI1mc4xrrAs5Wa/gOgQ+GMnuIFoM+CzTMfY5mg5VESeIjOLzV1lQk06EoP8Pf3Wu7XVy
	nMFDoWWfq+BIOSMixrlewjHqrqakhR4V6viH3WSo6NeZFLs0bvjDK2s8OCycC18OA5WPacH9ch1
	zNsSOujENJzdd0g39thHbq3h3UVS5x3UTHeXZPH6Ll1p+XkETsz2lNdc5aRX+S5CFPNjqksLJQn
	IsOXv1OZNFwe4ioqiR7fS0BejchbdHMfUpNORih9Un7cwxWm/Lw8Qdy5yXm917LE6WqRC4g85wH
	fGNO9l+yPXBTowFDgUmA9C4VnLcWS6QfVKM2irktl5ZbbXcmlmi+zrKvnubMSrI6y/TdSefck0z
	eSnStIwr8kbVceR6unjoQi7jkHOEkFLsq1hiFY0eMdKBJNJ+L
X-Received: by 2002:a05:600c:4313:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4bb55a83305mr140076445e9.34.1794826834356;
        Mon, 16 Nov 2026 03:00:34 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56689bc2sm168426655e9.2.2026.11.16.03.00.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 03:00:33 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 12:00:33 +0100
Message-Id: <DMWL0GJF8W4F.LOVVKMQHF9R@gmail.com>
Cc: "Jeff Johnson" <jjohnson@kernel.org>, "Filippo Falezza"
 <effeffe99@gmail.com>, <linux-wireless@vger.kernel.org>,
 <ath10k@lists.infradead.org>
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>, "Nicolas Escande"
 <nico.escande@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
 <DMRPC2GCD51O.S4DMHZFDKRFG@gmail.com>
 <CAFEp6-3PWumihQLg0CPR+U40sEUkEwU1EL7mgq8rnnmA4veSeg@mail.gmail.com>
 <DMTDV3EMV9WV.TFY5VECJNNR4@gmail.com>
 <CAFEp6-2a-0NSmSZXOdKNfB+C+2T6=hmaBC2zV-sfkCrDwZu0GA@mail.gmail.com>
In-Reply-To: <CAFEp6-2a-0NSmSZXOdKNfB+C+2T6=hmaBC2zV-sfkCrDwZu0GA@mail.gmail.com>

On Thu Nov 12, 2026 at 5:56 PM CET, Loic Poulain wrote:
[...]
>
> The 100 ms timeout seems reasonable. However, will it actually help in
> your case? You mentioned that the failures are sporadic. If we happen
> to read the temperature at the "wrong" moment, is it likely that all
> three retry attempts will fail as well, or would it be better to wait
> a little longer before retrying the read?
>
> In other words, do we expect a short retry loop to be sufficient, or
> is the failure window long enough that spacing out the retries would
> improve the chances of success?

So from my POV I believe the driver should not do any kind ok retry by itse=
lf.
No need to add complexity. We (ath10k thermal users) already had to cope wi=
th
read failures.

So what I would do would is something along the lines:
  - if we fail the first 3 times we read the temperature, disable it perman=
ently
  - past the first success, don't disable and report errors like before
  - lower timeout value as this holds a lock for a longtime to no gain
>
> Regards,
> Loic


