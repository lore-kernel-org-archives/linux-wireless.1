Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928405;
	b=RNh4mUhTD8YxOltlmpMKyFYfNT0BANv3UbfFqh95JCjagR1PTqQN8BFOXG1LDpDEjdTf
	 +7b8tDY8A4eW2p5VP6pM1QH9uTbwjXLwUnoWafS6MYRo6rITzzqnKEDFRaKioq1bmcqLQ
	 rKeBU1zJ2SsKp9XlErQut4Kyig7Rb0Z/4Pd5RbE1B6MW96GQzrGfW5LGg1YDdwXh+g1L9
	 q9cy0ryZhzdP+Ob92gbonOHfCRby9yPrA50RBAY00iCuk+GvJnbrWStBlcwnpPyy5EfkO
	 KxrJqgFNfUnSlg+s2eoLRducp2qaxGer6Fd088Z/JfoOvozjArSIx4qqXe6GfKJNylw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f+YFQvL5C9p5UH90uuV2o0Lu6pGVMNmrGLVZ9HmJFk0=;
	b=BrNwz5erpNLVmDuzHfqOeR9eqRMjJmozbK8nag8bLDboY0PISAU0ujKZyDLFcPliZOca
	 9MME6XXrySUN9dV0+lVmReNmLC8jnoTuF5ZJ9PZU2MwUapz4WA/hvrjw5NIC/GEUce3NI
	 +2M+n5yyj98S4MJloYdjEBDS6nXb3IAEXajIhQweoCX8q7+DrTUrsWbMmBtKeQbIwHyKC
	 q6B75aGNTpMv9YE855CX2MWreVXJlYRnjLG3KQS+ZrNjVtISDw1Fia40lhV2+LKBA6a+k
	 XIHfs3XHjNVAgcsDOf5pNRKHRZ+CXzMK/IHzoJ2SHyDolxKFJPmk+qzVV+mYvs7cUZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ez1x1tV;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748B1606A32C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 15:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 748B1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ez1x1tV
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so20830855e9.3
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 07:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794928404; x=1795533204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+YFQvL5C9p5UH90uuV2o0Lu6pGVMNmrGLVZ9HmJFk0=;
        b=0ez1x1tVETbVuKs6ZgS6iPGAnZoPBZ0m+F351/Nr7XCUBKEY9rmb0bxdjrJkVjIv7O
         4Bq6UA6HR/pik8uGM3gt5Te/RoB7+knum+XI9YOR/hkQbZ1alm4wIb+vxUtMJt2nBZ+v
         sXJdcBP1Zq+J/hZU2KIz3WhSIDNw57Hz3XhfTveA4DeCEKkF+Z7oLe5KgWAYDL+uYPqa
         kfx7AsRDAa9F2kPnPJ7m+S6XGsWO1YqV05tMZ3ue4NxDIUWbPtwmMMwqXCBqJ6NmHAS2
         QSe6H25gie3d7x1l0oyjuk3gstSyQXgk4b6EGfgBlFSENB37foBk05rBOGynIQWv71Ol
         n6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794928404; x=1795533204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f+YFQvL5C9p5UH90uuV2o0Lu6pGVMNmrGLVZ9HmJFk0=;
        b=cRs6sldbgES0IH7ym73/Dte3LI/cJ2jo0HTdBsiPUB8H9Vwd7ZEhQlBj/WglsSkwSz
         MmuXlhyl7oi1PqxV72ygaHPSt2agEe40XcHlFiBsFVmhjF6+tmn7b0PDnML6YHB7oqo7
         rksecp/s+H3UKARH7utMlQlOSsjLptmqtfYIrfEhJgLa9yDbHFnlZNUHrPTs8jfygf3D
         W23LgUvt/n+e6pIOj3oAB/bzyItt8MW7J0V8ZSUzVE4JK4bwBwg1V4kxeERT2d3IyGIr
         NXw35YpxF7RtNWW1iPyhb+43i45Mthchc5qCeyCrsxnkB/Oqxvu3ojiWvQIgRXfehr/7
         QJBg==
X-Forwarded-Encrypted: i=1; AL+hErEzzdhibbKepfLygT6KW2rkSD2BlAffbVPBcNsUKGSh22zozxILxbnnji+2rdv0i090ihTgpzitzF0/idr6pA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Gkkyzi5D5vL+lUSwrEXWLDBBULdTsaruQr+SP0CJhSWrtODHV
	VeQPvXAsZl18PB7XXv7jQpo8D1jR56eUxLtwOD7VtXpcSvwXsrjedkOM
X-Gm-Gg: AYBFou22lH00GV1RBDb+9BirlodoEs0wDYvoFesmcl5gEyBNXlV0FFo9tk1YJDyYjqS
	t3PVtMZg27J8F7ypVJNDyiaWMVtXWCcEzX36i4cqvKZb0FlL0CcMWYHhmlAWKlZ+Chn6RP0OMpa
	xI6PaE0WimUSWA+J3bRK92nZW/0artOWeGKY2UxvuzYlnekEwo+F4/ukr1u40u4q0M+PzGBR2Ny
	U16TykHh4R/YM8jjdrmDuC2yoJgpdoVbFnxRbyv6IYw5cSvOEmakjt0nrdMWf9QYZCiM/0oGUz3
	4dl5mDtAFrVLxwCIf11AlyzTWUDKr9IeeyDM61Sbe9TVODjC1EeP/GUY7w+BwC0KBbkVrPn1eqt
	xNM93B2E5XmUJL+DZ+npDzsInlXjmfGnGzqwOGGHLZFsEzHXL3QgMbruGM/JlsrHwtrDNUvrh1m
	3yrgqTKBW6rNYpCboU2IIn7qFMSqSy64XEchuAArNsjwWnkw0swheDosq+bzAEgPTwv3imnDo99
	qbvxh5ikiob8Dwdfz4hPR6zlM9ylT5pZNiafj9LbTglav4JDU0L6NISCum1QC8lQJmvAlPxYLZv
	mf5ZoXRDWJZWaUAHJ6hDU/39B1necy0EDqc=
X-Received: by 2002:a05:600c:4f07:b0:4bb:7b4d:6396 with SMTP id 5b1f17b1804b1-4bb7b4d63f0mr23921525e9.3.1794928403587;
        Tue, 17 Nov 2026 07:13:23 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb68c00b10sm146014255e9.0.2026.11.17.07.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:13:23 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH ath-next] wifi: ath9k_htc: do not fetch the beacon of a finished countdown
Date: Tue, 17 Nov 2026 16:13:22 +0100
Message-ID: <20261117151322.1801523-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <878q2rtvbk.fsf@toke.dk>
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

Hi Toke,

> I think doing a similar change in ath9k_htc would allow us to have the
> pre-check use the same function without this issue, *and* get rid of the
> setting of csa_vif without any locks protecting it, no?

Yes. With the check on the vif of the beacon slot, csa_vif and the
channel_switch_beacon callback can go. I'll send that as v2, and the
mac80211 order change as a separate patch.

Mehmet
