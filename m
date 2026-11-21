Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288536;
	b=M4z4qW5HaPx97zZWXH0AlFOINUNM7UqALkbVmuA+ieoQPzzRvyR0bGXoo3oZZz465hrh
	 APibcjtHq6wga3HVSkXfIwsJj+tZk7coT2f7mcYb5d77RevhbUdX0UAeG2A9PL47ZQe2x
	 nYaUcvwh0oW73sdiLN5RuiY91N2eGkPEMKvxwVpg3KiyckPdcopaw2evujIbUgcmk5mXd
	 sCAVFXqT4VsBy/6252szFi5uC97JE3bEe8vudThPinxWlAECSTJNZ2GXcPeqrO1+afibz
	 DCXIM3WCd6k1KzNigFRHFYo7pT0gxy/SXeKQA/fhWYGUPQmaOe88Vcmlq8vzRK5QXjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=U2ZE1yTZzCnv0IKZ1SiFuOw4VA0ene+ckPv8Qr9Bs4w=;
	b=NnUMAeCFMfY2/HM6PfQIAKt1d3vvKCkyDfmob529HWzr7PH+nzAq0zaDVw66oimlUfN5
	 4T25Pw83jl/2gptOBcQ1mt4/7vWHtK4DxhildHB3kwdwdpeSRq/XRhpKe8dv9n0b+e9EJ
	 dognvgVLm1w9uM99jRjqiVi3ntsZjp/HEO0UfxLW2DRrx48zhIMgJikdeifeuWRpqSpsL
	 HomnTDJYpAlu6EogWayfG/CutUahWK8k1ZvduchcGzISW1viMTezQXEyxwILRl2ZFLaJR
	 sP0w6Mab6oyCk4Xm5FJa/IbY3ifEzjncP1bkuCIlW3u1Ywz0e0pPAwpP0LW4MKgIXbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjrpbuO9;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F113606A6B5
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 19:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F113606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjrpbuO9
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dee593f18so1851633f8f.3
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 11:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795288535; x=1795893335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2ZE1yTZzCnv0IKZ1SiFuOw4VA0ene+ckPv8Qr9Bs4w=;
        b=RjrpbuO9LfQQVEVt7AF835DeE1+ARdOtynFb8MYNw/26nh+7kmxhzSPi145lWPKXdf
         SLS/WF5Eu1m8FbuavdFg+RDiqgduT8nlI1KGwklkn8dVeM9cyUQXrOlOiq0UyVjx2Hco
         iIMfTh1dvmspaW7suIkBX73ayqa8LBPx49jWSziBZnoKljIvQ8pkjAz1jvh340BDMx7/
         2oKxQL4vAqwLHeFiH0DFdyVY8qM26G6ikclY0IdEUu6r9iOUoIc7Bp7N4ImFB0L3tIr5
         Bbt7lSBQQaiIerThUzKYs5EP2AHFJHyp7kDtMAm+wJ4XPJRo9i7tdYd4q6kmtq6yFHeF
         K9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795288535; x=1795893335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U2ZE1yTZzCnv0IKZ1SiFuOw4VA0ene+ckPv8Qr9Bs4w=;
        b=s12tkujQbPZNSdtZuEavHDoOJqDYuDO8olg3eRhp67HrWhUXl9+uWy6GYY8yvIxRvK
         8wgrzXnAprVpyaM+3GaM6ff2oO7K0/sAIqjH5o/D4PGaGdqYugGZdAf7wYHO1nGITo3n
         GkhVXfHskriMwibWPtFaigU8L+K8Z1graQ1RMLSfTgy1OVi5pTzAPbXc5hFVBhkPSvD3
         gc7Z1aD9lfIYGXVmRziZ5SA4c/J1krh0j05YCtUMtL8CUP1CgutRK1dvFknDYNud7WUL
         AHikjMMHl/jiAdzWjpsprmuzUzSrnJhdqka7iULqn+slsooJ51GREhaP6Axa5SwESQVx
         Zdow==
X-Forwarded-Encrypted: i=1; AL+hErFN/9dRAh9J4FCU6Y61FoyjWwhADcpDrvmRKYkE453rguxXETInHIODtEBA1jBstU7Wjq35n7LTh1sAiFxD8A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+rDHRqUxXgyaW9qXopbKnCQ2QNF+Z2ldmDeEMLfdxdMBVNcoGG
	82QIshBkZRedFfJUbHG3bGX5RMIg5eaQKjblLZT5KbXJi8pJ0AfOw8xE
X-Gm-Gg: AZFdTZfU4ioxPH0xvppAgm+Lr43oUKRY3TvNzur3nvx6MSOb3vdb+/7GqstKcZVGrG2
	se9x9f1d6SJssVH38OlvSk723Cc7tO4ReiPYQHNEVvRI0OzWpax05BCZypBjmCCUufheDYzdTUC
	nZZkQAEd1BaVVaheQq5hJ6K5M7puNmwbWFtxUUsGaPCEkFUKF54sVn7+Puq7r91wip5qya4sxBZ
	PeYJJyL0Ek4pkbNt0n8YTWkyLWXISkhnqTK8HgZECNQ8Y0UKDvuz6W+jTW0DroKeUV2nryu9fQb
	0nDcxhcpTyd1ruYtHWPhW3afqwTvB2K4WRNr4oUFPvL93Tchx9G/oJ/6t2Fo8tPwZzrltM1Dd7G
	nx/okPZq45A996XkHn2VXE55qLRQprwnlC9zy6TnbayYeFWapGJokCblK8VKpPQIFHk5CcKy0xZ
	l8PlqQpLo9Pv8kRgQG45VyvRLSfvVTd5MHBiRXrnhHNGLylSWRmkPYjoOVzWONclUDQt3mYiEvB
	dUsvkQwEiNuFSO56MhaNjwRSi4PJwt9Jdiasb29E7bRLidSfuKqU3bXcH2D7G+7w4pQKOGIep1N
	1jBlgajcaKXuijPCwIJS/msNZYhzSUwZX6Q=
X-Received: by 2002:a05:600c:1d29:b0:4a9:2a92:231f with SMTP id 5b1f17b1804b1-4bb88804d4dmr162931285e9.7.1795288534610;
        Sat, 21 Nov 2026 11:15:34 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm194929325e9.7.2026.11.21.11.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:15:34 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v4 4/4] wifi: rtw88: reset the stations outside of RCU on firmware recovery
Date: Sat, 21 Nov 2026 20:15:28 +0100
Message-ID: <20261121191528.591334-5-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121191528.591334-1-mehmet.fide@gmail.com>
References: <20261121191528.591334-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The recovery after a firmware crash removes the driver state of every
station with rtw_sta_remove(), called from an atomic station iterator.
rtw_sta_remove() cancels the rate work of the station with
cancel_work_sync(), which can sleep. With a station associated:

BUG: sleeping function called from invalid context at kernel/workqueue.c:4722
in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 14, name: kworker/u16:1
RCU nest depth: 1, expected: 0
Workqueue: phy35 rtw_fw_recovery_work [rtw88_core]
Call trace:
 __might_resched+0x13c/0x1f0
 __might_sleep+0x48/0x7c
 __cancel_work_sync+0xa8/0xb4
 cancel_work_sync+0x14/0x20
 rtw_sta_remove+0x34/0x10c [rtw88_core]
 rtw_reset_sta_iter+0x20/0x48 [rtw88_core]
 ieee80211_iterate_stations_atomic+0x80/0x144 [mac80211]
 rtw_fw_recovery_work+0x1dc/0x2b8 [rtw88_core]

Use rtw_iterate_stas(), which collects the stations under RCU and calls
the iterator after it. The recovery holds the driver mutex it asks for.

Fixes: bcafcb959a57 ("wifi: rtw88: use work to update rate to avoid RCU warning")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
---

Notes:
    v4: no change
    v3: no change
    v2: Reviewed-by Luka Gejak, no change

 drivers/net/wireless/realtek/rtw88/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index 564cddf0bfed..98a7741ccd0a 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -669,7 +669,7 @@ static void __fw_recovery_work(struct rtw_dev *rtwdev)
 	WARN(1, "firmware crash, start reset and recover\n");
 
 	rtw_iterate_keys_atomic(rtwdev, NULL, rtw_reset_key_iter, rtwdev);
-	rtw_iterate_stas_atomic(rtwdev, rtw_reset_sta_iter, rtwdev);
+	rtw_iterate_stas(rtwdev, rtw_reset_sta_iter, rtwdev);
 	rtw_iterate_vifs_atomic(rtwdev, rtw_reset_vif_iter, rtwdev);
 	bitmap_zero(rtwdev->hw_port, RTW_PORT_NUM);
 	rtw_enter_ips(rtwdev);
-- 
2.56.0

