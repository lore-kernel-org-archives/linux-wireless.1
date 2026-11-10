Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794346491;
	b=BO4e+QufBOgmHHudUtc8xwKbHF1MUBP4r6mJibVKeO8GmosHOPhN/CIwTzns9UN8+m/C
	 z1stjon8ry26dw+3vym7iCnrRWeBcVIUENe+eZVv9S4RXT5KE6dds8keOyLlMQ18CdD93
	 RqLU4ZBnNRtxrUuwETKnGTXGaRS80VBWpi2IColm3qReciUeTuBNXZKoZ2Q81I6kTVYq1
	 8+9QpBFjieAGL7rAd3vDMsrbI9I6DL0APLOZOqQlinjg/sEeRhBefpiLfMC28bWe/PUb9
	 GSj+E3b5HEDV8SXzcMQJ5CQVhcaPlDHBxZtpJHWLDQHmXvsn2xqzEl7Pi9XTgIn4w2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794346491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kn3iaBA+TWk0hHS2rgVYu4JsxeOy72hg1sbB0FgdpYA=;
	b=LI5/ZIDOOAfy8TTOgCp1HSx50MnQSdxp1mVzJCCkbtW3Kh/ga6nFBSzkz0DEyuETLz2j
	 zHLEDsuHjLUIwrMq+8IIjVA5cBI7VMvRXJbhyJhKB/q5p4bSlWdkGjTxzYi17RDnGX72e
	 pESVjrpARzlV5MkeybsgU92pmoscf318B4Ht3je993FULv/QBSyi8FA9jaBpVg1GZAkDx
	 XzcDBbKghxRkBdt3uTo0i9nZ7Dzb92RPXhLfklFZacC3WC2mKGWI1k0lTMBDdaYNpYDFK
	 oIU9vq1yQCFY1A5uFrSfihOhY4/LFkRaJDoBTppIQJRElD9OjGv7/zAe73LHbl148Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jzWkRBz7;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B43F606A32E
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 21:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B43F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jzWkRBz7
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so27021295e9.2
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 13:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794346489; x=1794951289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kn3iaBA+TWk0hHS2rgVYu4JsxeOy72hg1sbB0FgdpYA=;
        b=jzWkRBz7Z8TXM7SyMnfS9c3MJyimsi6L3sBOh1730BnM0zcNLqFMigxC9bRyl9FskN
         /nxo3WFjawFMTw4vTLA9UQHlYc/BlDT1TZSXUDP+bDxbVaMf8Heak2ijEcwkrXC6CY5v
         MO/OV7S6Q0HPSvw6aSWBzqxyq2IYujA1qMe8urFA8d9ZbuwJkGp+GHry9gHqq1gw/nF2
         1yFOYIoSTBV8Vz9XCOQmXPgBAWWKohbSmIzeXqYMlT+sVWw9BO3/DKipElmBeaL5g/2V
         BMsZB8rYDNrsnu6GeTHMiY2H60YuG8gWQQfVYco20FyPZjtlDTTIReI252ifP9iDDBw7
         RlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794346489; x=1794951289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kn3iaBA+TWk0hHS2rgVYu4JsxeOy72hg1sbB0FgdpYA=;
        b=V9Ka69c9Rc6Jy5UgPqwK5HKJrynYmW97CxUuldW69wpb+slWPVF9pSHqD0V7Sd2xu7
         SKUF/Um49lGyUdMpNb1h+CXhhZrdlfWeHodxQh4reW9aXQCTbYBWSUAjDAJJoweOO9wM
         IV0YcpzqpCHKEHG8qj1mdtxM1x5aLA+SaYJOabGy9zqn8/EM8l9hNNdp65m7Le0CZbvg
         zDr2O0kVpXzKE+A4pDk9atZ77T4wDC24eSNoAwvmaNW5hRhTCgWl+mqEPio4aJoFzCmM
         54SuGbRJnp7P33xedJSthGur15LEvgJ0ySX9pwFTjfzO7IZlUYBBLSb+Gd5D7Qnq42Oq
         N1qg==
X-Forwarded-Encrypted: i=1; AL+hErHdbS4npT9YuIt5FRIxaO4o5XikoWg/Vckj2EULE++j1TCmi0lK3Fu8GdAkWPePEVelkfqzwxZhGlU5nGXynQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8wL4arFY7qPpbxIMecZKIyPEJjoHb0B2VIfLd/zkv7dd+kWDFk
	b75enODumigvHI6o/sSGf7tEz/QQKHNbeP+/lyFD1N4VjjICgPwjwAYE
X-Gm-Gg: AYBFou0/75fOq5TlzgG9m4jhFInlPSh3oJx4A3yyBFGRjSeg1OptkxXE+WMsMGmy96w
	gkZbd1h5Uu9YEspoAPjlUQK6Aul7GoRG8qYdH0vIXbO24AX4R5pLqC3xc9XkyZCoJCyErDVjoBs
	Tfqivlr6F9+fL0X/o6ub5DC/v/9ptteywj/GLI4mFojV8/6/GsSNHzZfTH3FXtL4arjt9HDt62o
	VhkJ173RnA0SvA/swR1UCseG9esWiHpooaANQbKZyB5ogBFgNTQ+aLzLPyxZ+V19Mn0SmrBuP9y
	o9EQcd61GsL80hA1ixyQRptvQn+Zn0n66pazMF9ezzLyVC/B9IXUGP9+Xx6B37ABbakK0MruZb1
	HgmSwU3N6tQ0tFuQ5861fx003iFkyUbjdhiHwVZ1owFmSk20GEpy8mn2oI2SOAkpyHk5/dytUV3
	F5/jInx8Zo0HkSWgx7kyi7+NypqpVg5gBNF1Chfpxmttos0U5sa9q+Dlypy3hQqPq6hhasx9GlA
	8doe4oKMu5w6Zz3VtMKCILl+P/nzvQCg+lKn330FOEAhtbIr4lLzI1JUQz2LzJoRFwY4+KjZTA+
	2qYVDWDRaYzavJskWqYcQKMVUTO2JfDA1MxQYGGPAieOIwL4jhYH0Uzy
X-Received: by 2002:a05:600d:82e3:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4ba093953c6mr5795205e9.25.1794346489304;
        Tue, 10 Nov 2026 13:34:49 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fef1d0sm87113475e9.13.2026.11.10.13.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:34:49 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>
Subject: [PATCH] wifi: ath12k: report an aborted scan before cancel_hw_scan returns
Date: Tue, 10 Nov 2026 23:34:38 +0200
Message-ID: <20261110213438.342-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
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

Suspending while a hardware scan is running makes mac80211 warn on
resume:

  phy0: resume with hardware scan still in progress
  WARNING: net/mac80211/ieee80211_i.h:2444 at ieee80211_resume+0x60/0x6c [mac80211]
  Call trace:
   ieee80211_resume+0x60/0x6c [mac80211] (P)
   wiphy_resume+0x84/0xdc [cfg80211]
   dpm_run_callback+0x40/0x124
   device_resume+0x154/0x1f8

__ieee80211_suspend() cancels the scan with ieee80211_scan_cancel(),
which for a hardware scan only calls the cancel_hw_scan() callback and
leaves it to the driver to call ieee80211_scan_completed().
ath12k_mac_op_cancel_hw_scan() waits for the firmware to stop the scan,
but ieee80211_scan_completed() is called from scan.vdev_clean_wk. That
is a wiphy work, and wiphy_suspend() has already run the pending wiphy
works before calling into mac80211, so the work only runs after the
resume and mac80211 finds the scan neither completed nor aborted.

Flush the work in ath12k_mac_op_cancel_hw_scan(), as
ath12k_mac_op_cancel_remain_on_channel() already does.

Tested-on: WCN7850 hw2.0 PCI WLAN.GNG.1.0-03342-QCAGNGSWPL_V1.0_V2.0_SILICONZ-1.81206.153

Fixes: 3863f014ad23 ("wifi: ath12k: symmetrize scan vdev creation and deletion during HW scan")
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
Reproduced with "iw dev wlp1s0 scan trigger" followed 0.3 s, 1 s and
2.5 s later by "rtcwake -m freeze -s 20" on a OnePlus Pad 3 (SM8750,
WCN7880 hw2.0), associated to an AP:

  without the patch    3/3 suspends warn
  with the patch       0/3

After the runs with the patch the interface is still associated and a
new scan returns results.

I tested on a 7.3-rc5 based tree with out-of-tree patches for this
device. The function is the same in ath-next; I applied the patch there
but did not build or run that tree.

I used an AI assistant (Claude) for the analysis and to draft this
patch and its description; I reviewed the result and ran the tests on
my device.

 drivers/net/wireless/ath/ath12k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 9fd3841f71b7..d4c1f7cd7040 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5875,6 +5875,7 @@ void ath12k_mac_op_cancel_hw_scan(struct ieee80211_hw *hw,
 		ath12k_scan_abort(ar);
 
 		cancel_delayed_work_sync(&ar->scan.timeout);
+		wiphy_work_flush(hw->wiphy, &ar->scan.vdev_clean_wk);
 	}
 }
 EXPORT_SYMBOL(ath12k_mac_op_cancel_hw_scan);

base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d
-- 
2.43.0

