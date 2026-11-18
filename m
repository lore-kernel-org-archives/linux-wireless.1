Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990811;
	b=VcR2jGOIFON1QulRsIs0xAsm1XQ3i++pksBH6K4YyMpJvmYQT0+kWwhXxuTdWwKUpySi
	 ajANuwUWrtwyLYD9+SD6qs/XQLLla56x05sKmbkc4VJpPH0kX0GgCQCTR5OpCMWKpmCjA
	 w18ZKBHT/3usvXNUn7lhTU2Ab4xw+kGillW1V867iae98faBpu1UkvHSWkeh/8XIhjefB
	 JoJ8w0XYI5gkZ+tO1SXLqjZHD84w4AvSWTpms2d0OhCVZXYJBec3giVW7LMQjYDIFo+S3
	 20hQH4ol026DEnIVLrW+AJubXWlazQuh5NI77NZKvDhU0sVvM1SBl5cF1BeSUhep5Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WZb+73Z+iGgox3eYm8t3NOu03PW/JBfAauUd0nob7V8=;
	b=pVnkUD7gCleYjbnuQjmXQoRfPCWlbY6cg3faRbATq9d4lv8Eb2vvMzdlzmv/g4ks2M6W
	 Q9o3gh5uufm4eM+osGOOETs04q+EeRKCGfDCtKhmN92wEr4fUbgizS4ViATHrhAvF0S5R
	 oC769+jabk613GTLuSQb/8VFtUtQln+vSf3iM12HEoKE0eBrEOSnn0H24CJTFLAVMJbqv
	 CJxfzCoFq0012avCyi4gUII19DHrq8a/YYc6OLugRcmVH0IVRacTsIBwo8r3NQyRSMQPJ
	 6P+CL52oRY3OZOnzbEubgFJ2/MZlRvkC4hF7p3ZH3imVYL2ub5YTCwGK5nv5uOse9wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bQO4D9qO;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53486606A88D
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53486606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bQO4D9qO
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so3222505e9.0
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 00:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794990810; x=1795595610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZb+73Z+iGgox3eYm8t3NOu03PW/JBfAauUd0nob7V8=;
        b=bQO4D9qOhqdRtujHIY8YK9X32hDfdF7vpHDzmnZKDOgSmy8t805+pS6gwQLlGGCG0C
         yeUEhGJ86k5Y6t73jvrOO5DyoL/Zy+h1GILrdZ5wm9i2fyB4ZERfAPH92yOw8yN95nSh
         9pb3kr9sLGBGFWRo4LiOivQC27hkdzYho/pN6exN695aVHhjS/Lif8uRyFUOgQr5gw77
         SVEBLNvOodqfX4aGDhAisUj3l8PNkXU3zVVcTQz0z0VG8Kt2LvGKv66vUPLosGQMXgWm
         QxfyfxsN/MGL7u+o5vIz0A0W0L+PjUrKVdq/wQJ6E3H+hUMGg3ysgTEXBeg2o+DLhRrf
         yXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794990810; x=1795595610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WZb+73Z+iGgox3eYm8t3NOu03PW/JBfAauUd0nob7V8=;
        b=WNAtJK451eDyaVoQMAXMUF1jE/UAf/BjfnkP6bbs40I0oaTCDdXI7MrmtIto/nbs0J
         ZQQ+p7++3Bz/G2pMjleCNe3vY5XD44TMNcedyGhrsfztD3Eyj2uTnfVchtVLZgjD55XI
         5UhIk0/UrdCLpHhkdnWGUsEmQ84uuHS/1fADfGkgfJadmXMvzyi88PUsv7R9onEXNTfj
         kbJ6yF4loweiTaNlK5adUQf8xoz/Fdv1WfztZPRwi1nN+X/p/dqbxB9mXEi6CDcZQatj
         bUIf8FGF20sbVHtf2rPwiXL5NlMdulcq2rn1EnnsRxTfyf1BjFKMC7oOQmlYJ2M3UKUK
         eASQ==
X-Forwarded-Encrypted: i=1; AL+hErFt0Ey54IIvAyKs/qWP+dpBzNRVHzpzCai9vf1K64LD0vGewWhwcv2DqKnBLX5NWRpxZCfBZ94q8nfLOUg9AA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8XkVDh7d4WK0ZXUfJ4B51EF5omY+aHqJCniF0IJHCP3tpZsr20
	tYwqwxiU4GdAT6im78rDCWCK33f6Kbs+NH7TDiW/0dpwQ8YrWGucwMd8
X-Gm-Gg: AYBFou3dVKtec5xidN86faCLo88XOmpRiTGBXC9mb+vjrYNsS8dl88D5hQW0c5EfFry
	4iOOatiRx5EZsN5/4tZQXyOnbLW3qqk/NYbQ7AbqEw5SN9Jz831d8UeuhFTr6PHdOvLfUhAtKGT
	xI/tRV5kSC7nZH8qIVl2+OC6s4PJKPCAyCdwTHSKYA+g0CFu1T7RFu7EwADnvutJMhSPypYlZcj
	l5nyC3yM6C02fe3u1mwcDl2SST5SJz7hp+GRxbiZ+BYG7RKvhi2oj6QteqRO6pKMUiqY2eCqHB7
	yP8A9RzMae2/GrJMu6VKxnyNGFDfGcXTeRrlW/HCQquedDj6NI5YrEHU6AgNSY3MJu0G4FKgHuJ
	vDQxyj1JssRb0M37VA29zot8sUYmkqWA63KDLRcx98VK5F22ZyUvCygFe2g08Dkpp+T6sVRdf1V
	0Ob5v2Z1B5GRVQMs9URz9reWu0AXzVYm1YeiQickFrpk9O27AGhbL5L27/+P/nZ7NJiCjR3PFu7
	DgDZk+2kMbTy7UV1f+CH7Oop2hgJF5PynkWoqTkttUpzDA2G3XTIQB4n7q+BOC7hqcJD6qeraq8
	4jX0bEe0tgOngnO95rlmPkl12c7/TCm8aTw=
X-Received: by 2002:a05:600c:6290:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb7d6cd48cmr34574185e9.1.1794990809715;
        Wed, 18 Nov 2026 00:33:29 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7843bd79sm127318605e9.14.2026.11.18.00.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:33:29 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>,
	Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v12 2/3] wifi: rtw88: support channel switch in AP mode
Date: Wed, 18 Nov 2026 09:33:28 +0100
Message-ID: <20261118083328.1984956-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <9BC4FC13-5723-4711-9798-11E3C285C7F1@linux.dev>
References: 
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

Hi Luka,

> I think the presence check is better fixed in
> rtw_core_check_sta_active(). Its callback only reads interface state, so
> could it use an atomic interface iterator without allocating entries?

Right, the callback does not sleep, so rtw_iterate_vifs_atomic() works
there. The check is older than this series: since commit 96fbb84de4ff
("wifi: rtw88: handle station mode concurrent scan with AP mode") a
failed allocation also makes rtw_clear_op_chan() drop the operating
channel of an associated station, on BSS_CHANGED_BSSID and in
rtw_ops_stop_ap().

Ping-Ke, Luka: would you take that as a separate fix for rtw-next, or as
a patch before this one in v13?

Mehmet
