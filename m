Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935412;
	b=wV//Hu3+6c9MUYxl8MwHGanNJfj0bWSBZ/kf7DKCzdDIRFlOnn8fv9baHPsdMrGTUIO2
	 BxvUNEM62gMwbr8Ts9/3B8t7v2STtC93K6lOEjrJICtgTLHEqeMTPUUYxd3eK6qQbfpJe
	 sYQWK4Hc2Ansjj2dn4+ohg6nIb0oUV3dAcacOYr+0bwPDN9p8LbBnbJ8bNs2ff7HqETxg
	 Zwu8IaI2T12qX6LE/s9bnW+7DCLdLSA5GTDjR0LyAs0fpHYCBRfH/rV+XSviRQk29iWPx
	 7aQqIyLzm43UjBlHE8rwWEOr1deWQ7ZeePgKnfObUpEXpbGbsTYrXaDtif8vK9odruQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E8LqwbU5CIbHYRLcBtBSaO+X14uxeX0JS1SkbfjW5Qk=;
	b=14op/IcCsBgSr4y5SrVV/ANDzT8JRAWXBnTQ128Xjk5gexQHci1B9WV4HsZTeG/de0zB
	 TzNxeQGnu4NJv3q1SJh/Pfb3iKjQc9oHUOta5fbsOWi/ozh3pjYVDZyY3QBNGLWOV3qWT
	 78+I444ah1EK46DGX+l0T+Cp3fDBQ1nKEzpGXBzEa6rod8fDoAr5kHzhIfedNktH5aQ4y
	 Upgk6yljGPPvFhunYo6Dnqk1GoGyP1pv56d/BEy8GkuJlqRC95dGrFSwOUBGChH64qvrc
	 tO5DkH5QE03ZU5LZmyFrd5m1ds04H/8zxXPrz4Ta0yIaC6PBL596ZV4jDXQZvUd37vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPdubFYz;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F33960A2623
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 17:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F33960A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPdubFYz
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so15601045e9.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 09:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935410; x=1795540210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8LqwbU5CIbHYRLcBtBSaO+X14uxeX0JS1SkbfjW5Qk=;
        b=YPdubFYzA/tTmkH69DRZMfaSp+RDopWGeS4BcvXlHTMDuP/oq1F4siDZnbfQrrmzxz
         Fl2njo8c+R0rCS87N19HsRYgzPm6Mr3Jfn31cCF6+ckc+lvchbmTwuk6iwjFboJXFnq9
         xQrSeojBfU8GwqL9oarhqV4dWDHtpR7Px7O2LEeC3wH50sMZK/qrVm7SOLe9m+10wQhl
         +fKlTsY5cCyqmCqKKRYgxVDAM0ZCNJ5HGStreWagmHV5HXpIVnhgUgWFG+5410jU3HeG
         v24ojRW9Hc+UEz+Z6Vh4/dy4h4J3QQkSLZUfox2o8nunbunvJR3cWyaHPO4nSVxH+39g
         xofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935410; x=1795540210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E8LqwbU5CIbHYRLcBtBSaO+X14uxeX0JS1SkbfjW5Qk=;
        b=NOA18IkXYQ4u0YeKSm3B280S6YnglhNyR3M7MAQhNJQa79a2Qm5fQ2SR6bHq4FTT3P
         kQbJNJ0qypq+FVBM51HIdBaDWPrKlpDNmU2dvVL4M1bPUya+MLIna3AfN+8MmG7hiai0
         ySfzLTxCT3q726McMePzJLg06gAAdrTnz5jHtsYv+j6m48m3L7NArVnIBvhGJYck4UJl
         tTpNhwwg0BHwcCAMJ7VqNQ2eDkL8wUyJ4rQNKBhm4L1xBiSU/hpHndvyswodIUWPmAWS
         lDHf40q0rke2p0tu2PLicw67q+x+yc2oEmsIPuBINQu0Jp47rhJ60fV6i/6cGH/N5/l1
         YW6w==
X-Forwarded-Encrypted: i=1; AL+hErG3FU2vFIk1hmqx12oNCfP5peSFG5X0paGK5EwfbJQ5+JlsyJv/ZOTMdFvTQDSDdNgLSba/JNRI9K6ADsOnww==@vger.kernel.org
X-Gm-Message-State: APuU4Z8e5+GNX7rmzN0R5Uk9ko3nj012J/3R7B59//C4RaelvAqzxG8z
	aS+ooKRSPWnBFVXUYSREiPPj4iPNBnIfdYH4KmJzei/5BHnf/zFBiBxn
X-Gm-Gg: AYBFou2BK0xJrkkvYxmMuJ9jaLRJKhEVtXv6GezdAVwAnW57Fs0mB3tiWdN8ztvJabj
	6DgnjhuL2mVgyCtDunU1WXkkiKhW2JA0WS82OHiNMp/SxFpT8gV3iy2QvWBOwSTl9lyMfvPX42+
	KPQ0X+ps57LlDq0zg3N4okte1cyQioTnOshqssjxCzNbuWwnHIG7BSyi1MtEI9Rdi5jmT6BvBHs
	rlyAdUC/H8C2C+1Bqi9XuoZmisfdecon5U12GzJWdlP47jzuFxv+euuYWSWljluzKp7qFsc+5+y
	qOC3gd3yUlbGQN5uEbLpZ0hIwm/AmslK0dwlmlW/FWOFWtxBBO1FSRHUr7IGkgVsdnFIXxVszR4
	5Pfc2WbsXjE0qgnVK0duKlHCVr7N13WDW17cnWJQ12Iw8pXXuD1oNBdVuLpsR6n/Wgm9LkEOYv1
	pzfCQBRkIEj7o3RxCVSFcA2utcXY/B5RXjwwNnnZdd1pjIGkwwO+ane4kJBKH2CWvvAHhZoUBCo
	hr2s5NiUIfIbySlrLj49YRNqoxWz3u2EndI0ZTAy6HLDK55uUMDM8EV0Hm1KP4ItT+9ss0hBXVE
	HaysTznlZsAHkRZdCOJS61PdimQzGsXkHbrWjzr9hpapThDSTkoJuJ7h
X-Received: by 2002:a05:600c:b99:b0:4bb:5d38:259f with SMTP id 5b1f17b1804b1-4bb7838bdaamr71396715e9.12.1794935409804;
        Tue, 17 Nov 2026 09:10:09 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6d079a2asm26828762f8f.16.2026.11.17.09.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:10:09 -0800 (PST)
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
Subject: [PATCH rtw-next v3 5/5] wifi: rtw88: clear the restart flag when the device is stopped
Date: Tue, 17 Nov 2026 18:10:03 +0100
Message-ID: <20261117171003.1840491-6-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117171003.1840491-1-mehmet.fide@gmail.com>
References: <20261117171003.1840491-1-mehmet.fide@gmail.com>
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

The firmware recovery sets RTW_FLAG_RESTARTING, and rtw_reconfig_complete()
clears it once mac80211 has restarted the hardware. If the last interface
goes down before the restart work runs, ieee80211_reconfig() finds no open
interface and does not call reconfig_complete(), so the flag is still set
when an interface comes up again. rtw_fw_recovery() then ignores every
later firmware crash, and writing the fw_crash debugfs file returns
-EINPROGRESS.

Clear the flag in rtw_ops_stop(). mac80211 does not stop the device while
it restarts it, so a stop leaves no restart to wait for.

Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-wireless/5285DA11-651F-4286-A0FD-52A6051B3A88@linux.dev/
Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    v3: new (Luka Gejak)

 drivers/net/wireless/realtek/rtw88/mac80211.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 5e40cf06a9e3..10f1ae08f383 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -68,6 +68,7 @@ static void rtw_ops_stop(struct ieee80211_hw *hw, bool suspend)
 
 	mutex_lock(&rtwdev->mutex);
 	rtw_core_stop(rtwdev);
+	clear_bit(RTW_FLAG_RESTARTING, rtwdev->flags);
 	mutex_unlock(&rtwdev->mutex);
 }
 
-- 
2.56.0

