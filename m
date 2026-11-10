Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280196;
	b=U5y4x8gAA0Rl4rJlC0oImiU8XVkFCwCa4kuZW2VNHscNh3kcP9AjjHDXqzpl2NV7zKgt
	 yw1XG2V70loDXHoQGE2DepsDGacrhMFUFP0b82XjHA4IG3irqdHuRoTqYhl4w4ghKmqLA
	 bSNyYZnQ4z4zI72J8R3pTAq3xxtBY4exoQB2QrasbqgnVwdU+RPjciKNt2cR7Os+aN9aQ
	 Gg3GNJXsZsjjbavQIajv8sILZ33rmiTZgdrAOWI/cqzSL4DFiuT1RZMTyHxIyLtDHD5Wo
	 nqT6sHJtv0WH3D9U57qTC7uhzkJJk4W5S07QzhKcRpp4SnRkiHe0buALiI3z/Qo55Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=P8yH4vKM/bxg1XRcWlOR7scRqqaMzH1r7Qdxunx+hdQ=;
	b=hrOq68Ncv8KJFCu8WSq4RVObWF1b38nZl1Hj6CVDzhfDp7Wl0pPhCGjtxIZAc/VJyeAS
	 o+2QGMs4hFVXtOPwXkxzvg7zpMsJkJ/RSUE0Ra0oZTBc+J5V/WYaUWIyXL/45LzVxiaPp
	 eIkE4Y5vJ3msHBgRnmm/mPtwtQR+hdL86X4QGR28YmR4vctStUX2/v9sRuxbBU6wftNd1
	 okRukMYhaY8FkkXDKqp1AkaOl2x8HkLCY0owtgxyMoh49ySRDZf0BRAazard7oV0tqd6o
	 AcHwb8ZgRTy00Nbwj4qJ8rrzJJCzWxdd9/xsOvuuSNmGVqdqkDSwXyX8rfNOJbW0yOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="pGm5wKZ/";
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3B3606A326
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 03:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D3B3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pGm5wKZ/
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b244fb7fffso1974493c88.1
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 19:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1794280194; x=1794884994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P8yH4vKM/bxg1XRcWlOR7scRqqaMzH1r7Qdxunx+hdQ=;
        b=pGm5wKZ//WZRltRaTw1tmvTuMZJln5CqY0VWf8SH/etDNY/3qP/8R5wxTw7nj3AyXh
         5+RYDOtSvck4TemSQcmjjZVccAEzqAjQagEdHJaSOzNVBGvEqIQXEEyARgtw+ZrdGYC5
         L0NhHmkJe+zN27WHsnVTFHku69XCn2fQ5V06gt7x7vFIFnEu8z/H4bnN2qN22q27g6GZ
         dw+cZ+9E9YQ68c/22fccYQeOa16zok40G+afvLXooG8xU4QrKeeRzZ114qiWDdiXWkTU
         sCi6iJHGNxJuJdssnX9FeLcBZ691/je1CNkSpSK8Gbfpgc5VsfG9/X+c4/ucEq7aMSgN
         n/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280194; x=1794884994;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P8yH4vKM/bxg1XRcWlOR7scRqqaMzH1r7Qdxunx+hdQ=;
        b=XgEwf6blMif2bqlUvQqu0x5ZyvYgR/irvPj/ibKQ764kY2ccffxdTtu0z2xQ7p8Ufe
         ZR7V3VoG8oGK7hi8Ye6WMIyYA9WAPoG4OjulinmMWs8h43y48s3EMqpwYuIDZxaIcmXS
         WVVEczkN3lbZTgjJK/spYrtT2sJoL8FsXVXjGTW45mNcpKJPh3vKWq+4TWQBF1DbZ/mr
         fhmxayYeqW4lTUQnNZiU1MNVF5b6G4lt64k6KMxP3WPuMIiy8NDuJNdystkHPOcxbn5i
         JxzeU3EofnkQDQ9FPCZzZht44h6b46Z7BFlFjWohWjHYBs0VQrn1LYKXktTiCglxYJl+
         LVaw==
X-Gm-Message-State: APuU4Z9tGgmL5GFml2tNsLYwAEV71YRlwV85fmfG6UKYG3OymPfVFVg4
	F/IUTKeRyEW2oOum0LHm8/HwIO3bUbzvqPdQ26fDwiIJZyhuC6v04N2TYxPPSP64UURJ6C3/Cg9
	TAEmco5M=
X-Gm-Gg: AYBFou0a7TwWS63w1gXzrlEtMvoWE9DO1sDrGbVmN475fR2oHj0zCWcYjejI/Zcgtii
	EESkxlW4ZjgH5pzT2dYF9tm2s3hZbCUUgx5DyKB6BlqlFQpSVwwsOKEQm78Uzjwv6zWkFJUCvR8
	/Ow4THZM7drC6P9SE7XL6lgZ5jp5SbuMfcDi9HD1AVD7HDvNIOIxwIMdlY7WWUW6aYB0eFDGeW1
	cuJo3Ar0GXI8R4K8j0e9z07wo63QNjytfFz16u7PaxHlR13rz/VpBfKecPuwQxcn1TuVo8t4fhw
	zfwE4NPBkrsvsdPRDnWLBylzD/UpQVrF7F21IoU22U8BByUljaelhWMDHja1vDf4gyLvsdkRUD3
	/lR3kYXHCwt17dKkfm2ERLlDJ3AxfOEGpVuWvWQ0hILp2gEveb+flYB++uxgW97kf1qVJYEpCxW
	xV205j47waJw7Jutr6WZmM3l86Q+TMvsDWYXbBGGkqPe0wypvUJ0lh90vwWIO7JYp3fm4X/Z0XT
	r2XWEj2bNoHfc+WGHIAnjT+4kXM12TX3qC07VemzBf+MXpSwUkec/MacLhHywvJpFk1bRQrHoul
	Zma/5zcgKINARd6o/dOV9gaA7aCwy6tMjzSDYNdDrfEWPTth7+qTirqeuM1yZnE4A54a
X-Received: by 2002:a05:701b:2905:b0:19a:8e3e:530e with SMTP id a92af1059eb24-1b3b5fd2228mr1743196c88.8.1794280194280;
        Mon, 09 Nov 2026 19:09:54 -0800 (PST)
Received: from localhost ([60.227.235.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4eef8sm3373549c88.16.2026.11.09.19.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:09:53 -0800 (PST)
Date: Tue, 10 Nov 2026 14:09:50 +1100
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH wireless-next 0/7] wifi: further RCU optimisations
Message-ID: <bld4b42amzq2heiwqnhoyg4rwclrhmetjtllnwnf4bflkhkr32@i2hxopwobpfq>
References: <20261102235603.1181883-9-johannes@sipsolutions.net>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102235603.1181883-9-johannes@sipsolutions.net>

On Tue, Nov 03, 2026 at 12:53:57AM +0100, Johannes Berg wrote:
> I'd done this earlier when working on the update-beacon ideas etc.
> but now more work has landed so maybe time to post this.
> 
> It'll probably conflict to some extent with the queueing rework,
> but that seems manageable.
> 
> Basically, this gets rid of a few more causes of latency due to
> RCU synchronization on scan, aggregation, and STA removal.

For the series:

Tested-by: Lachlan Hodges <lachlan.hodges@morsemicro.com>
