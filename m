Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794432764;
	b=LNzTiLXDBbOuN1UAneWngEZ076fXPkoyMSUDgjAT8mdl5BWAM4+RCug5hCgBv136ld4Z
	 kR4T42Rsf1H+ciu6990ykKvciGGoEkf6qVITEUzO2SLE2PCUHbxPeuK0QuHOb+SFLs7rO
	 FHsoWkw4tcUsJ3AHgP5AYp1TD55qT0riSm6OMQyy0gP9DKGuGMfyitVuMeF/XsmytJLGP
	 Mk/szI/Y4Unto+1uDgyBGK9smMC0E9UPzjH38zwKStlFuV0kB2ilng4g32gYwOzbj383D
	 u34DqEVqG2mz1z17XAZjlQXW0XD28mSoG6Yp65P+pvvh6sOBafIqe3mNjgl5sPKDOTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794432764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=M+TpaTj/yftQYZX1A+rcyn9NVdk1/tyCnpT1w7BBP1U=;
	b=5EslamdZWnxXWo0hwGrsJK7AVj02/Rw2Vm5p1NH1oyonNiwg6z8gW95v7q0jxVBzH0DS
	 vdrwIUUTRpyjN3uLpn7nYAGqoxQFdzYj9g865xO8pufVyev70tH8zkJUiZG6jSJPSsDFJ
	 b/L+nALFD6YTaCulaI5/9U6P0YiCZ+VhjJlkWp9odjgGLjpocsai9c12zkS7fsGtXScZ9
	 +KBYuoR0wzIhi64NY/nZAv8tNZ19t5Hlz65Fysd3uqcSkiTXXrHF5QtdaTBkV4Wclev7j
	 3gE1dnqUtKGo/D0HYQ23oCRlyiwak9zsr2EiQI2VMf9RFwz7Fh6DRQOAhxL2UmWEpDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jNuNlj3I;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782F2606A890
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 21:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 782F2606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jNuNlj3I
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso38288785e9.1
        for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 13:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794432763; x=1795037563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M+TpaTj/yftQYZX1A+rcyn9NVdk1/tyCnpT1w7BBP1U=;
        b=jNuNlj3IPNpoic87TfOjXZsSoy+I9DAEO4vP8zDJZ1FAOrxj2Is68fEyYO1VOPKOtR
         s6EyiPPhf8vuWG3QFWkaaWYm6greU+pCMACzTKZU1w0Ach2/KqkTmVolMzgEFz8bCTyz
         0XC+OOwnALiZOykLXxoEYVcmVUSY0mSP5tPGXMfNl9Co948wNYwU1NLodW/8T1YTzU08
         bXU9Mesxq7szC2U7MRToMHpX154EroQZiu6UYUDRzPC0ddUQtL+eOvRjKV2kU96MJIOA
         nV9xLsPDBkic5H2RWRingfO5giiZknEuk9YtpupPugCLk8+elDunfQ4CFwRPOKi2d5e8
         mpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794432763; x=1795037563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M+TpaTj/yftQYZX1A+rcyn9NVdk1/tyCnpT1w7BBP1U=;
        b=ofjvpd7AGDtHKkURATGz6j0+3AndBDHHGnjn0nP+obpPdSpZQkTe4Fx7u6moU1gsrG
         vNW3Po1XKC8csocCFaFwJlyifiymRPt0hcnEHNxEfeAhrdfuIXrO7Q1S7G7nXl3TSkXX
         /nBqAaMRtVlEdneep8wezVdeHWWGyfkRK66dgQF9fxk7a8ES4IUj23fZGOJDjh1xaNE4
         eYRLpdsKOaok29L2e6/4Lzm7fqFRblf1dXByR8BP6SKlOV4ENp7V9/1sAFHQoTS68JU+
         eFzAFdc3BKvcFtZqFep2Qd1EU7j26vD5S3uphzEARoQ27VAdW1XiOUoexmVdGUTm770Z
         vUdw==
X-Forwarded-Encrypted: i=1; AL+hErH9yj5OtKdhHVM8CNMCRp3ATUBZNT7fBULGdsEQaeF1KIdG+XEFkU5ylJUKmaxPFeHNWubW/zKtA1GTUMDc/Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z87nMebhAfdBi4KrkSLODwXIwxtVOhc0ScHPRjbvHHYEwIwbnG1
	Z3tKzz5iTDCXzqJFUtolYldjEv/Rd9Ejav1FdCdDrqTc3/CoorELZTqE
X-Gm-Gg: AYBFou1bRuArpfrpAOMvrTqzMJ6ly2JocRiojgE/fGCGGxJhM7KLDHkIQz8wzqf+3gS
	MsXh+9VLnHJBum08lOMY90zEG2bddkCRI+M+s7oUye1kKg3JsuiLxBua7LZGX5pYWYchpzg6LLx
	xp17A6L95pNyzQStN686qrL/tssCfwSQRcdP7yoirdRoTYtfUiDUmfDiY9E5wobTMfZT+rmP1yX
	akqMKPrZ36RYwUEsBx10I2PfbQs2YrfrbIpHU1P+7lu5FJvTc+fwJnV7+Jqj0W7v0HROMu4hB72
	WeJIGoa2tNHoiJsLOHiGgtnXcuOBtxcbdr34pYAmblI7qcdngxLy/9adMIl4EW6cgc4fdRYAfla
	yI+5RpdRnVib8Zn902Pw06IZmvwe7Hu/8lTuRaxoWvNbWBX6x/odqpgQgRznolPJfS2w9/FL3XB
	Q1plOHzPhOtBCmHPUNh8VkFv2AfQAljfIPLR5Daujydp8dXWm/aX8hDEmwWr5K9x0w37la4/O4g
	E3wIz2D4xnUGWZFz1rTa1/yC78Rrvf0EcSCYfY/ONCJCbR+ZmEAxdjH9xDwaYYPatZiqIimdBB+
	eysCAVqKnHXebl17//bMqFdUbZ8bEjm2qnA=
X-Received: by 2002:a05:600c:3491:b0:4ba:761:97a1 with SMTP id 5b1f17b1804b1-4ba093aa693mr67003845e9.14.1794432762791;
        Wed, 11 Nov 2026 13:32:42 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba095200c4sm36726845e9.2.2026.11.11.13.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:32:41 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next 1/3] wifi: rtw88: free the reserved pages of an interface on firmware recovery
Date: Wed, 11 Nov 2026 22:32:37 +0100
Message-ID: <20261111213239.569224-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111213239.569224-1-mehmet.fide@gmail.com>
References: <20261111213239.569224-1-mehmet.fide@gmail.com>
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

The recovery after a firmware crash resets the driver state of every
interface, and mac80211 then adds the interfaces again without removing
them first. rtw_ops_add_interface() starts with an empty reserved page
list, so the pages the interface had before the crash are lost: the
next page build takes them off the build list and nothing frees them.

kmemleak after a firmware crash with an AP interface:

unreferenced object 0xffff0000cbe22c60 (size 96):
  comm "hostapd", pid 25545, jiffies 4296463067
  backtrace (crc cbdc21c4):
    kmemleak_alloc+0xcc/0xe4
    __kmalloc_cache_noprof+0x234/0x3bc
    rtw_add_rsvd_page+0x38/0xa8 [rtw88_core]
    rtw_add_rsvd_page_bcn+0x30/0x58 [rtw88_core]
    rtw_ops_add_interface+0x144/0x2cc [rtw88_core]
    rtw_ops_change_interface+0x6c/0x80 [rtw88_core]
    drv_change_interface+0x100/0x258 [mac80211]

Free the pages where the recovery resets the interface.

Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/net/wireless/realtek/rtw88/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index f7708ad17b6f..adc54b063382 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -627,6 +627,7 @@ static void rtw_reset_vif_iter(void *data, u8 *mac, struct ieee80211_vif *vif)
 	rtw_bf_disassoc(rtwdev, vif, NULL);
 	rtw_vif_assoc_changed(rtwvif, NULL);
 	rtw_txq_cleanup(rtwdev, vif->txq);
+	rtw_remove_rsvd_page(rtwdev, rtwvif);
 
 	rtw_release_macid(rtwdev, rtwvif->mac_id);
 }
-- 
2.56.0

