Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199255;
	b=eGqG0Kg9TcIX6i232U7QzF9tb5vxH5B4plpFJ43N2JDPnXQHakRQwyb7mEvAlArGJlHg
	 zmcI91ic9YmhEFn2wn+RQxiWqEPF4tzjOsNR9STfQf0qDOPf6GNxlUvLH3+pnnFomU+Rx
	 5aVnWgkf+Xi1bySSIsjEfCXsxinnE5ZWFq3UjF332dSwkDnHV/FWLcvAtGozSSS85LRUP
	 aHCzO77o2nWtSiHMi8G3IIUV7WioIaEoNvtmLxxzwOt2wPabytidDjEtUixutI7i0ztB7
	 hi1b3tNkuNiEfYI5GQC1Me76bGKKltUVNd3/wVSIIZmcFzCV3BSYf8RT0fnSRh3CK1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GIz15JgjnK5uTt8nm2/0a0kIukD9hLXTrgL/HU55oaU=;
	b=r1OTJxYRgK6I6fCE21UWQ/Xg8y5DYkMTsHv/bHHLdjZwIR19fqohzBfeNA4yb1hL2AdY
	 8ekBHsnzOyLf91Llut89WHuhIjmGFEy5gQOk8n5om0S3rx60xvG28VTs3WN43nWcvv8Li
	 +ZGKi/nroWjKmHqyMjdS7eEKSwv7mEQechH+uKlQYJirFdeavsgjjljy4uccn76H24kFQ
	 jmMDyz+xBZh6bgdKIzrN3m9PkoIHH1uiLAtkxFVgZNWKR3gqBjt2IRggmbrQyWn4zyBkU
	 X2AhRxWtcLlIL8CnPEOCLlPXVZrMNG9IjpPWEehMlHJOJLCJF0VlkTQzgrQc7HyhBRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IEegjj8z;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE1D606A32C
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 18:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DE1D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IEegjj8z
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-94961d90b79so151883985a.3
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 10:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199254; x=1795804054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIz15JgjnK5uTt8nm2/0a0kIukD9hLXTrgL/HU55oaU=;
        b=IEegjj8z97epEN0jfTn7VXYwngNMROpE2hFS1s8D7vzRzDq7JD/qHN8DSMBKXQpmQd
         THS5XLRBZo8uRS6rwBUFjPt+lx5+ArEMg9+rGiK+9M7RLRm8ePYiGZvhQ6X+zfX/lJbR
         hkPMb75itGmvPPO04re8FXrrrMBUn4Uu49IyDGqjtK8uBoTkByGEMGZoP+8lJSoBnLhH
         vrBREKw2V17TToN7eh4F7sSxjzgIZA3o7JSCisDpmhUm7wQ0opbf/LroA9vN69jQMRsH
         JiVU5QoXYUyR/2CHUuct+heqtcXa/SCIoLuNLtl0X09dpK1xy703+A42R4JFQ7m21mOT
         QYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199254; x=1795804054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GIz15JgjnK5uTt8nm2/0a0kIukD9hLXTrgL/HU55oaU=;
        b=f1fN2tVQC86s8xAvLLJUmOGNqYnbFBhBfTyqqe24XlTuXSO/HhkBt0CXWlR7yX9F0s
         Qyo1ir+PbMkUPRbOMTJcu4jJHfDffRAUF8DkhkiJ4zlY+4rOrIdoFTtYe9OZv5b9hvds
         1k4k7YGCcl7bQ85xn9MVlZkdVeMj7mFLe4rAfqhhG7KkOxP67U8A85J/PbUnJva/pDwR
         mQowMQ4uDv4vT6321/AYpDAShMtViOZ3OtTCMRXwtlZllMNEFQWqFElhgr7NjeGfJnk3
         taFgrqZW3du7xgMrBGSmTLyZWlB0GX6EKTUB9lwg7CZwx7uJmFVq8fCLNDxoXsXsBYUz
         xYsQ==
X-Forwarded-Encrypted: i=1; AL+hErGEpYMaikcaLHe5tL3CIeA06ea29NssZu3FrUOSCC6aSJSDrwFlGu2szdSKGggKwScgpUsB17baw9Gck4rLIg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9fZyLZ8lG8Koqi06vMh0J0BtO2N2h4nuc+dkZPNyLFi10Kt13o
	0CQQ5zhYW6mpxGVq65gL2Zwtm2xIf6OQ+xOPe+QWZxX+0whnekG9AwOk
X-Gm-Gg: AYBFou1omWjP3XdFASeGaC5PX7bOogGM/QtXn7e6+WON8ZCQzGted3/7XODnJCkit5d
	JoVEAD3q5vI5vhyoqMdvmauStdZDAXyA+ixqWfr37FJ7aMnJSXka8xx22nsCKfRlPODq0+v0DmM
	E5lnmdx01NODoQjPelrUJ9CKn+yh3enFB0EupTiNlGwTILgLBkDfsTpQ+k+n503LQwFDfAMlQd5
	RmdHKhPScWuSU2Ay/G06p0GJvK0TrPZ3KvsXgfMWqnyOEI8oMyD4va0ngngic33oVqbaN8VRdAf
	IfBWLLPI6wDrojFnEXTySo9n9RytmRxH3aD8IS7/IjfAVJ49NceZuAx/7OCZQ2kJWOHl9bc5PdC
	ep/agHCI9hh/BbpQKf4mbhms7kKIR5Er3hOZekdBbWlOciuxCRIRdVyAlN2SYpBkq3kIQPLoKmG
	cru9l8ZAYzX8/LkGg8wUpecofD/wcasizcHRvAWQVkH6Tg2LaQyDoF3+1i2sIZoe/JrJopGm1dg
	XqMCXeoXOrA8euzw8T0p2HJPKSYkTDhAvRObNgxhu/5T1UAo4lZ4TZ3V/LNyTGqn7ucXmVEprZO
	1IQQMWG1cLLQm/inuhMO5HMR8l7j5Rn61GiGGv7JFSrW3EL1wuNK1yJP
X-Received: by 2002:a05:620a:28d6:b0:949:7656:ca0a with SMTP id af79cd13be357-949ba99ab2fmr687727585a.35.1795199254069;
        Fri, 20 Nov 2026 10:27:34 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb4219c4sm253599985a.41.2026.11.20.10.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:27:33 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>,
	Zong-Zhe Yang <kevin_yang@realtek.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v3 3/5] wifi: rtw88: do not drop stations when collecting them for an iteration
Date: Fri, 20 Nov 2026 19:27:30 +0100
Message-ID: <20261120182730.467748-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <0f2520cdfcb86395317a39637bd0b535844e34b2@linux.dev>
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

> Thanks for reproducing this. I was looking at 0bdc579dbfc2, which
> already has b719e9bced93 clearing si->vif in rtw_sta_remove().

Right, my test tree was older than that commit, so what I wrote about
rtw_sta_remove() was wrong.

> Could you rebase v4 on rtw-next and keep the si->vif check in
> rtw_collect_sta_iter()? That should cover the case you reproduced.

Yes. On rtw-next 0bdc579dbfc2 with v3, the client was collected with
si->vif NULL and was gone from mac80211 after the held collection in 2
of 3 runs; in the third the watchdog did not collect it in time. With
the check in v4 it was skipped in 3 of 4 runs. In the fourth the
collection came before the client went back to AUTH, and the removal
waited for it.

Mehmet
