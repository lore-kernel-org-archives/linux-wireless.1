Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587874;
	b=eiQLT2p0W5lUkrp33gcQEB6ldMIZ8fvsgRsTRsD/5bGKjlrTpdiE/PG1jA5PMJfkrIXu
	 3qMz0MiBNuVse3ReJRLawBOJVmWRLtSj/Wjs8ohhFh/3lOHiIFYQiwBa1jQZeIjY7tyes
	 OH+L40NkkHOuAXM3Htu4gPXO3Sp1jBH+fJY5tiuFRlQa6VyjUz5Wg/cBINuG6tObU9Vhc
	 z0p4UdDV5F8hoTBVt0qVXyJWHjjrThKZcBBCvo920qDcslv9358fPYMrrbtUGPJCr0s3k
	 XFJx/StmhA49waLv0EXtm6w70/JA1fcsdc1M1BQBBMCu2dysepsT6yBvy0LMcepQpIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZQsWRLmOjI6MWITE5i2BHhTTEhDrYVeR825HJ9sXg2s=;
	b=izTYDVF8+NiJJWgO1OYQ69LNx3Ik3vht76g+Mg34a2IhiscMXTlG4BXmOv6W9oE4OKFm
	 GdM/gBPuc8fFeBcmahXvnQ9AY90eRjlf26ctbI4ha+BZ3OHx9KTu3gOQSS9I26kWabyKa
	 hjBTdrwq6ipXCH4+oYWXFZ4Lyg1846x1dF2bfnAzSm1PyaXXMRk639dI0PJV5zZOzF2qB
	 VaRtRl95naDz1mfD3rSbaBWaNMg+GQX7E9RXYBV2HS3oznd4nTuBSqdGK1t5l1kHN//X3
	 9TKIfvONY7c1r/BLlLsRAHnZuCGO1qiofZsuBlc4DWH7BM6nDPn/SJtfjozfiCEoELg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=ArV2ryvm;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CB9606A326
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 06:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4CB9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=ArV2ryvm
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso2250658a91.2
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 22:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795587868; x=1796192668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQsWRLmOjI6MWITE5i2BHhTTEhDrYVeR825HJ9sXg2s=;
        b=ArV2ryvm/qDFsW/4BJC0tMGbCOx2gT6SWvkk2itkNge9rQIPDAYUHGyHGeLQquK14z
         LtDohwxclssuBm09UuyCAuokUt0RIRpXxuQ/zzqQgRqvdMzHfLuW7Q4N8iyTcfVwiaoi
         +WpcIhYtD7BqMB49/MS4wypCCURlt2ttyZUO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587868; x=1796192668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZQsWRLmOjI6MWITE5i2BHhTTEhDrYVeR825HJ9sXg2s=;
        b=h5Ijgv+no0m7Tl1kfrjLb4ke9SmzVG/Q5OjIk6kgFNtGO9ZEDvyUykunpzZTfJ/YC5
         UEnJVPm0yYkVHDZf00zTA/UidplA/zdXQWjCF0ifNueIZFXep64KvtkKPW0AzQBaYOt5
         99JXv5bbHiW5oeyQPWdaWCTa1mGN2Rbv+zWME6sNac1Kwqa8i/WXSnkjFiAMxCG/Rdan
         iSJPAR4B8A72yNCCPDMmPuN5gamkYZOI8etekZy5tLDSHvRMDp1XD6SHGFY438effWJP
         quW9KiJcVyjtqTpzz1BKEGRgtWS1LYoRPvHvO9YZQdS1JQ9N/vj7AYSCot5CFnEsQZxk
         8r4A==
X-Forwarded-Encrypted: i=1; AL+hErF8j1exwqP2meLnXmZ9VB4gkHWKP33TAErnHFHMApkCkUiiLdqholIKW1/zSwX54Gj9OiNYzri3MmvaynO9DQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+bo6XaAKSloT0KBO9JHwD28jd6skldMCrIZmm9CwrwYPOuBJGA
	++QZC5k+mgtQhqTagJIFXVcUI0x/xKEqs8+BMXdkJrmI5k1NmzrmagbcPikMjSlZErw=
X-Gm-Gg: AZFdTZdABCn/tC+QFW9dHMd7NdyO7jITYl4OPaShLoXfAbfa0Qe8xt9D7muSMfn4BB5
	ONW6epWsc4sJPBOnOHXATpbtbm6fuis6Cw6PVhpHlLDU2lOoihMyNJbmn/6G1uxnrVmlPJerVMy
	X4u4SgbKSTQMz75lvzODeDO+NyNaQgIt++J4TY1qnfzsXgWnS1Vyk0qbLNzcb07iSt07nu6P2os
	Y/oL+FlLKImu6NiyuO8Y6ieyzm4MxfthkoybFi/9vIcwWJnglCLc9yLX5HSezK4HN750JoJsM77
	jQO2/nvikRmIt3/Fh+Rodizm7ifnOYT1S22KWf6vLMlw4Mxo8eoUXB/sqX/TXL/gQCyUGB8LZJN
	8DsvXpY6JR7P96dFMufD9omlX9lzVI2dJv+n8BW/05Ienjy23nK1WOXsfrZszFKwmzigZ4GJODu
	DEQgtmvXssI/j1+Lg+jtqmrrndqkPx9jq/DldCuun3i/f8J6591ht74JNpdC5Kxek2U8XWUWXlG
	gp5xFtKNeNL2nE+svDa0aP1rLboEkk5uM4O1Lo3hBLieVRp8XMboZYX5lJMkXcjhoI1DPrNGL1c
	t6KoxT5IfY4nUUucvlDYodv/Xyf1X82AZWZnBaniE/cjhwYiFmQ+X4rn3C1GH/TRkb9KosPKNBJ
	Xv9CC0kfV2fkGzqXD4CiV/XxKvLVQMNwCsL3R4tuoe4E3lMlcm1fve+lSR6bGO+bHEFAULeZyEb
	V4yzmiPKFE0Q==
X-Received: by 2002:a17:90b:3d4d:b0:3b3:b71e:b2f3 with SMTP id 98e67ed59e1d1-3b41c95967emr16704304a91.45.1795587868123;
        Tue, 24 Nov 2026 22:24:28 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm29191820a91.15.2026.11.24.22.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:24:27 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: johannes@sipsolutions.net
Cc: kapil@presceralabs.ai,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	piyus@iiitd.ac.in,
	stable@vger.kernel.org
Subject: Re: [PATCH wireless 1/2] wifi: mac80211: do not copy the mesh RSN IE twice into the beacon
Date: Wed, 25 Nov 2026 11:54:22 +0530
Message-Id: <20261125062422.948748-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ac39fb1720fc03069317f8a74aa0f34d86db2e30.camel@sipsolutions.net>
References: <ac39fb1720fc03069317f8a74aa0f34d86db2e30.camel@sipsolutions.net>
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

Hi Johannes,

Thanks for the review, and apologies for the delayed response. We have posted an updated version of the patch addressing the netdev-bot+sashiko feedback here: https://lore.kernel.org/all/20261125043805.883952-1-piyus@iiitd.ac.in/

We also plan to send a follow-up revision shortly to clarify and rewrite the commit message more concisely. Please let us know if you have any other feedback on the changes.

Best regards,
Piyus
