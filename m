Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194206;
	b=cfM4EFM/YGgiUKoMsX776QAkzzHPz3eoAWB5+7D06soTd6is+dgD6xvJS/geoPx6NTfc
	 sbg+6jaVTRTjGseRV9tcx7JJjJ+Na7r0g1blcxwEaSNVOqvPDpGHyiHBysZ2ItN/jRu0n
	 9JqXAVCO/Bjo2PEiBQcqSSzMR1iK455jJTTVx1rkCVqi/OXzS+ng8ALXrNqmIAEBxQ4cj
	 JJncIBuB4i1fKEty3RYf2Ag2+INxBt8wXQ1aVZE3+EUxf+V315XWS4WXQeAxak+Edv6e7
	 I1cvm0+nqe+eoJ9+EQhGdgA/85KknTCWYjQC715ND4RcNkgR/bPWLe7cy7ZoixGpJug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r6uSRZqIL57UK72bcNqqu1ABAmOYAhrBf3M+ZeDZmZs=;
	b=Rcl5A1QpB1V4Z2wgYoZE+tGeM2qHPem2yU9RLhzR6LIYoTbA6+s/VaMEqDG7eaR2e8Gc
	 tJgN8Gw6hR5W7lZEEt9O/WkAnHPAycsNBXGDB/zCLIy5cFCzhrZB66lakZq01vkij9spN
	 5Ya8oD8YuRYii1Ye22SAmHCndNm4HH1gSduDGDrbg/YqrZZz+pmT63ZbH7TndgKb0zr6p
	 XIff3ypwfA5vbqpJRccjiJTFrBDssRTTLWsuHfRoyAvxfBMpuNruKhkic7Iqg9n+/E6Hs
	 wc/OFyuO039Y9uV7l/jenZSAfMsahK+2Ed19zoxb2tdvDgvM1CUG3FvbuV1Ftx0bJww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uswgotb1;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD205606A325
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD205606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uswgotb1
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so11357855e9.2
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 09:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795194204; x=1795799004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r6uSRZqIL57UK72bcNqqu1ABAmOYAhrBf3M+ZeDZmZs=;
        b=Uswgotb1vpMIIY+cv3aw1m5pohAcxOB/t0T/jSPgFt9SOkzYv7XaT7b7c56Jxu67+d
         QK4XYLOi5jUf8ZFJFB/j/me30mONakYngZtQxD1PIdTtTPJkqvZH9RxSO8M7FJKr8035
         Zd7fEuFJGedwBbH0U/3GJrWqpkYFfY+RmxZu8qhlkCjzIcTznZXIZg918gsrUcnvQQET
         poQNwWSzqRZoJJ5sWFQmMCstvMr2ZmF6A5eZ0i6dDBlVCJPooBsAkt6q9k02K1lxnhv1
         V7mb8Yic8MNjmBrswXhF3tHB4qsHU4M0RCLOuc5GOEWHhr1Jl3D7TXjKNqNYlVS05cEe
         tCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795194204; x=1795799004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r6uSRZqIL57UK72bcNqqu1ABAmOYAhrBf3M+ZeDZmZs=;
        b=JKil8nfzQG7nMz3CnPEKArbSjSAX1AIaYQ+R3XpdiJBWLuXUHVCsk7yA95XGAHZ/Z0
         dtH24YHsDXz2JZ53O1urPafSeQeGvdT6KAhAF8cCWdCpNTSTGgul5CN7g/SMMvZeD3gp
         4dZh1B5txx+IZJA9UazoLIDQSK3RAJrp3cffsWOyEaI5AgXEADm+AmMTMxseuqFpgW7L
         8Uz3zmkMpdlfyMpAKgekZ3k97qB3RogO5XCn3NHKq9nEuJPf/b+HXIba3R1yK/jE6wlZ
         yvU2bmzzkfJ6Vo6RGf6EJ9lk90SjAkdhzFvYWz7bP7FBOwHe7GgpTQ5fa97r5zk4ZRjR
         9Byw==
X-Forwarded-Encrypted: i=1; AL+hErHq3yhLrAgpmCMs/3UFpiSrUO/iNoCVAMMsOdjXOqFF9vF3WyB9k4Kh3wWZoY5TqFd1cCJnNQlEm6J1Qr4Opw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/23rMugtyRXimAV2B9VEvVLWe5YgzPNmuGF70LPIb+Q0dxjizg
	GITmzeAXPx+AuaJeGxdpmZA5/4QlYVpAwdwaHuKhhB2Fk86yPEF/EdULDasNww==
X-Gm-Gg: AYBFou382JPJYTzqQHmsorFT0YtO7stuG1/pO22z6U1V8TrLrzxtg01qPs6P+vlmpJy
	WRVxE0lN9GGhMihkg1I6s1zuX7ARXtWejQya7EOFMyaEv7rpe6LBBv8BrtGAZao4IFNxButlqwO
	mB2g6Gw5EdWyOoPg6ME/OKjbwt1nhUvJDoGlbECik8cyBpJry1CN5U7g/lG4Pw3olqIEoOxB+G1
	BhEICRMvWCyT2kHS569Iz0ioNgPd2RY2ch6lv9tGeZDFiHcyoU0S//gtJ0Ahr6yZpse27d+ZfdB
	HhyikzjEwu+wADG5T0EQWvEvvxMdj0KpWvbwKQlyebr/qpI0Vw+I57P/71mGP3mQNRA3z3GiFu+
	y/6qeK2hAho5ko0d0LbwwwK7W4+EdRphhhFRNK7NRWkwNUm4wKORm5XOSiNfOhT/KvzgjMl/FLH
	9E9DxibNZvNeu0xFtfHil087zHtLgMGKoeiSuX0KGgg6y631ZhyJNRUfl6S1dggYoW+0YcnHijQ
	7CuDU64lw0N94iWHZBlTD2Wj+X2zRmSDQM0sTURHX6RAssRMAXfWbQ0anN5AYoAhFd1ACDlFyS1
	JY7H2yUJaOrkvpVtb62WbAwpgSbm1K5a558=
X-Received: by 2002:a05:600c:a087:b0:4a2:5267:3cd4 with SMTP id 5b1f17b1804b1-4bb887c9fbamr86177205e9.3.1795194203876;
        Fri, 20 Nov 2026 09:03:23 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm6239126f8f.26.2026.11.20.09.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:03:23 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>,
	Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v13 2/3] wifi: rtw88: support channel switch in AP mode
Date: Fri, 20 Nov 2026 18:03:22 +0100
Message-ID: <20261120170322.375333-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120141554.68116-1-luka.gejak@linux.dev>
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

> I think this can finish before the last count gets a TBTT if the work
> runs a full interval late.

Right, at this commit. With a test build that delays the step at count
2 by 150 ms, count 1 never went on the air with 2/3 alone (0 of 5 runs)
and always did with 3/3 applied (5 of 5). I kept the TBTT pacing in its
own patch to keep 2/3 easier to review. If Ping-Ke prefers, v14 can
carry it in 2/3.

> What happens if the page can never fit? On RTL8821C the driver has
> eight 128 byte pages.

The switch would stay pending, but hostapd refuses such a request
first. On an RTL8821CU at 2.4 GHz a beacon still fit with 778 bytes of
vendor elements, while hostapd could not build the channel switch
request above 586 bytes ("nl80211: Could not build channel switch
request"). That message carries the beacon and the probe response
twice, before and after the switch, in the default 4 KB of
nlmsg_alloc(). No chip has less than eight 128 byte pages, and an AP
next to a station interface is only possible on the RTL8822C, which has
16. So I would rather not add a reject path that cannot be reached.

> Could we retry the first beacon download after the switch too?

[ ... ]

> Could we queue a retry for the station if this refresh fails?

Neither download is retried, like every other beacon update in rtw88
today. In about 2360 kernel logs from our test runs, a reserved page
download failed only in unbind and firmware crash tests, and with one
experimental change that is not in this series. I would keep both
paths as they are.

Mehmet
