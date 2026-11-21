Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288534;
	b=Z28aRUSa/DXaL7t8MzPurZpXR1IDa+XXgOIp7ptUM7mu8Uh4NkqyR43eulGet3UpTNrR
	 1ISFLWJmfBg/5AXYK7ZESzAXKTOM1rsGVfkA7lFaSadj+EsbWzadX6n9LnxdUtsEulpTY
	 LZmJPnG7bWF1cCQS2agZNTc5bEdbidhpN1FajHV65HMmWXKSC0dLcXjW7iYZeql3pxpxy
	 5dgFGayBJthWtDZIcnUTR8++L4mol4gXJ06hfpVEHlZQQHN2hr+LeGVkapwekwO6Y8jUx
	 EDTamodEyJwtPDY67ZMxpw2ipJf8/Bk7mV05uyhy2kjwNQm7+3L0E9Z5/LVMVvvpGgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Q4WD7Jk0cw2TjprWNqsQesqn3kn3kUHgcZy5hZWTIA8=;
	b=inrnZRkdKNXTJtGCcJTt3h14OrK7R9dfw4aL8S+eaMDyYuPwnoVjjgJvjzCR+quw6FY/
	 nYAfS+Vb2fFFjVdUU04l1nGlNZb1C+MMZEEMJGbarPk3LN5P+DH/glA+i5/yVN6vytKhq
	 meGZspeT2DSnwr+oMXjO7tJLh9AiFHh7zIgJAaxbiEzQBciWhmQSCvj6wDy/nCuF2jU9Q
	 IBBSWeCj7OoCKEAcwWwd5NbFn7ih7Nr3N3298rLFokYYUarCKz/oRz8YDZlF/F2K0JzQX
	 5h9P1LazcjXDlRaluVHx8tcJzZhv6gIELtISI+RZmeAoYR0uqbIaEcA3PeE2rvG1vvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=biOl1fS7;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B236E606A339
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 19:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B236E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=biOl1fS7
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dee593f18so1851616f8f.3
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 11:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795288532; x=1795893332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q4WD7Jk0cw2TjprWNqsQesqn3kn3kUHgcZy5hZWTIA8=;
        b=biOl1fS7Ss4E+Q1n81nIHaIPbpQwjXpgxrWdtRs8bmZZh8qWbVavgqucuLGq+PX83I
         4qxp9aCsmgpuW4LWaWnp8jy8AHzAnzQOZT93Sro9kj/jElmaZ0cEzKk//F9kGv+5xDod
         k59KBq8HrumEMVnN0Tjgl7LLLlf0/9ytBBCxSTPP8GrtXboATbFG3kvZ9ywPusd4fmW2
         dTVEP++GyYhHkqyCesH0FzFNlsOUE6Ri0fUC5XaI9dzhn2bYlFWyGse3a9CJudGbbtD8
         3eKLuKQny98pl5+A6ODggZ7JtNQe8V412sVCHBmM3br4JuekeSEL5kFDEbc40lCPZjON
         fhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795288532; x=1795893332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q4WD7Jk0cw2TjprWNqsQesqn3kn3kUHgcZy5hZWTIA8=;
        b=iH93bTVySnMs8T0kYKNU92RyegLQbIOnkgYA87pQKzE4JUQ4M1vuFiG+dCtQTXHnZh
         bFeHRBOOzDd450McrRO/K473J0yDG2Xw9auLjbUo7yFGxN4F1+mDVT9dTKpz9vlykXS5
         tV9pkSOhl2AT7qJuxuDgMl/fd/1B5yK8Cdlclbt/DYctLIACmcCqaclj/xrACQhizqJu
         gdN/0PFZoGSs5vt0TpEwkCBIeCRRMHfQc6uBj+4EWsVPmWk2p2VS4ryf35PivlRqB7QY
         10kf60K9ZnmlVtlMjSirCu2wsgyXSz4+A18UeqskxQqpa1qFgZLsrGxVPlpG5sdmDw4a
         pLRw==
X-Forwarded-Encrypted: i=1; AL+hErF5H1JbsT519KnNfdddAdhxZ76Vbej/gcHYbC/+FvLSfgNTiyB4Q+mOy0mm6ZNc4sQu8D61TMTWGbtk+1snow==@vger.kernel.org
X-Gm-Message-State: APuU4Z/5G8Cv5lr/nrzSF8dtnKbXIXd0pWMTh8dvgOT1ZQTl2komMgHt
	d32IvtoJYBC5phjWwpr7hSjTP1H3YfWMiaO4PprOzTzBgJKw8GqStsLJ
X-Gm-Gg: AZFdTZebK4hkOB71LSQr82mH3l44GP1woUgOF9Pi8j0SnmQLMfRYHioScquxCl2obHu
	nW78X49GhHRCNt0a0CJnfZC/mJ8x6FT/CI8L+lns9D2IKkGQB+69VVn/ochtdx4CGNxkDMi3mRv
	bAyesnq6FwhJYZ8ys82yDCoVQuHlnsosuWKT8m+1hteFh3RSNlOby7rAjgnNttwk9gckYSOZGeP
	CgBflDopHxs3AI1zqTYGZT+pNT/ZsGr4YPTKsXcs5byUfbjgUJoKb6p0gEewwMLz2gpe9wp/thN
	VVgjoOGKYr+wyFYtxP/ATdDmvS0qr1fQkcq4oCirdZa1IVUedtV7QejCeflKotJ9sQ3H5LaNpBj
	V7LaVVw3gYdaV44fqylreYjBGWj9XzdqyQxahx5RcqE+D78TeJICReVoKBE+vPL7fJHMpx9EDBp
	JlNrJv10GEzBNUno8KrgWXmkfdMhDxnSGpTJ2+zb93CpCYTHMfnvePfKuaNGAJaaz6taZP5O0BH
	pZNPG2MQhrANK9qVAxEoWxMBt1O/I6RH4FOFob9AtJX171Brg+go8mL0NX08Tn0bn5GXngIRylz
	mtz2GtyTW03KbQ5ytVSwjaolveVPrpz0DIM=
X-Received: by 2002:a05:600c:3b99:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4bb8880b984mr175856705e9.14.1795288531829;
        Sat, 21 Nov 2026 11:15:31 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm194929325e9.7.2026.11.21.11.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:15:31 -0800 (PST)
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
Subject: [PATCH rtw-next v4 1/4] wifi: rtw88: free the reserved pages of an interface on firmware recovery
Date: Sat, 21 Nov 2026 20:15:25 +0100
Message-ID: <20261121191528.591334-2-mehmet.fide@gmail.com>
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

After a firmware crash, mac80211 adds the interfaces again without
removing them first. rtw_ops_add_interface() then reinitializes the
reserved page list, and the pages allocated before the crash leak:

unreferenced object 0xffff0000cbe22c60 (size 96):
  comm "hostapd", pid 25545, jiffies 4296463067
  backtrace (crc cbdc21c4):
    kmemleak_alloc+0xcc/0xe4
    __kmalloc_cache_noprof+0x234/0x3bc
    rtw_add_rsvd_page+0x38/0xa8 [rtw88_core]
    rtw_add_rsvd_page_bcn+0x30/0x58 [rtw88_core]
    rtw_ops_add_interface+0x144/0x2cc [rtw88_core]

mac80211 zeroes the driver data of a new and of a removed interface, so
track in struct rtw_vif whether the list was initialized, and free the
old pages when the interface is added again. Until then the pages stay
on the list, so a download before the reconfiguration, from the beacon
update work or a WoWLAN suspend, still finds them.

Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
Suggested-by: Zong-Zhe Yang <kevin_yang@realtek.com>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    v4: keep the pages through the recovery and free them in
        rtw_ops_add_interface() (Zong-Zhe Yang); no port checks
    v3: no RTW_FLAG_RESTARTING test; the page download and the page
        location H2C do nothing while no port is in use (Luka Gejak)
    v2: the beacon update work does nothing while RTW_FLAG_RESTARTING is
        set (Luka Gejak)

 drivers/net/wireless/realtek/rtw88/mac80211.c | 8 +++++++-
 drivers/net/wireless/realtek/rtw88/main.h     | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 3029fbdb288a..b14d7fffb98f 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -166,10 +166,16 @@ static int rtw_ops_add_interface(struct ieee80211_hw *hw,
 	rtwvif->scan_req = NULL;
 	memset(&rtwvif->bfee, 0, sizeof(struct rtw_bfee));
 	rtw_txq_init(rtwdev, vif->txq);
-	INIT_LIST_HEAD(&rtwvif->rsvd_page_list);
 
 	mutex_lock(&rtwdev->mutex);
 
+	if (rtwvif->rsvd_page_inited) {
+		rtw_remove_rsvd_page(rtwdev, rtwvif);
+	} else {
+		INIT_LIST_HEAD(&rtwvif->rsvd_page_list);
+		rtwvif->rsvd_page_inited = true;
+	}
+
 	rtwvif->mac_id = rtw_acquire_macid(rtwdev);
 	if (rtwvif->mac_id >= RTW_MAX_MAC_ID_NUM) {
 		mutex_unlock(&rtwdev->mutex);
diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index 525f17590adb..5291de0ea38f 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -830,6 +830,7 @@ struct rtw_vif {
 	u8 bssid[ETH_ALEN];
 	u8 port;
 	u8 bcn_ctrl;
+	bool rsvd_page_inited;
 	struct list_head rsvd_page_list;
 	struct ieee80211_tx_queue_params tx_params[IEEE80211_NUM_ACS];
 	const struct rtw_vif_port *conf;
-- 
2.56.0

