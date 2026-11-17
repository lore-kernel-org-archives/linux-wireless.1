Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935410;
	b=PZis19w3Xy2DcPfUhup26Zexj/QP3bnq0nS8Ro1iMMx3zCZw5Lo+noWKXFml0yV9m+Dk
	 oYxeDt07/FJ7mmUsHSGGW4G0bDuRazW9bE2I9FnQfcODlMO6BkEyl19BB0JUqYSDE8Ys6
	 NE8buUrcN02j5qqmryVoR5UBAT9rw1krjOxUvSOX3h5pfzf/pfAg0w0Mu5duN26tNFVEC
	 C1q+i0Z3RV4kqP2p5BVXsMgUzfCuytAUsedXHLLjgVvvkThmyaRwoD8x8leIp558158ee
	 u6GLkJT9Xr0efBwn/LnfpNLWWrV9n22PTBu9hebd/mkljoCM7yKb16Me0kWstpZA3EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CoRmN1rx1+FlXyRXu71X9XZHSrkqHgUxmdKVAdzAPz8=;
	b=sV4VX+Ys1XYCFFV4cKkCA03E27uvoYvn4Zr30S72eBL8BxS+IinpEQANr3KK08C9DfUl
	 huApVJHHHj1oz2OEEoksqo7vOmbZw3MerpmVoZK6kmO7YeMg7oc3fS0queP1jXHOHpoqb
	 UzLi882h5VulA5KamPfgG/nb3a5DRUYHjohRXigp69iqbLIbJL6YZUPbKqZ2Ii/G+YKo/
	 XDfk6oGDijX5atUjt1W18sV0SZQjJUAL0EmMLWPwwhRQUf/79t1uwx34ewZ7iS4w+H3rY
	 gQjLtEBRO4MoVhY9cI2qpouwEtAG98ou3/1smYQBXBhCaU8NfRHyqCoTRd8jzoxFbIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBDEyX1l;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92B6606A8A7
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 17:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A92B6606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBDEyX1l
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so422474f8f.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 09:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935408; x=1795540208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CoRmN1rx1+FlXyRXu71X9XZHSrkqHgUxmdKVAdzAPz8=;
        b=TBDEyX1lIcLXoGaoP01j646LcuXOvZZ3kW13uJf0qLjMH0tUDrshOcQuzxodhV292q
         +o3SQFy/fTMixvzDb7QduZWPnBil5eyBhANvSF8+r+j9U1ragZnNu9iPb23C9v1/t+Qr
         Ka3I0UrqQcnvtQ+UUZ0F42JuA0LGasmKfh6wMjW33iGDUMmHmOSW0WzRAc6DUizfw0rq
         WN01o7KKLcFtqU7xeaYmIVggsi5bBRyPZ+KgeVP9oU7WACALWplfux97fVgsdmbypReE
         y0ATMn9QqokAs2TH4dh3hWRgEmtCG1PvDzWEZnE2mOH6nDfKQ/bsMoxH2jk4xwgYFq5K
         Aq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935408; x=1795540208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CoRmN1rx1+FlXyRXu71X9XZHSrkqHgUxmdKVAdzAPz8=;
        b=xYE+F2M9xoNYewKoEDz56e1OcN/Fl9xmPw1Kjf+zZT+DayC2HZhlNtvlNA0L7gbqCA
         OvKJmH8KxssDQVIqC6+4jxJtUaiZ5oJwgVYxEBONbqc5ceToThB4kSI6uOqSqRAZiE1G
         8wppVIYZh1rrXjuYt8zW2vpgIsWMZHHrp/Kw3fX+sPa2Uwy16ScF3lDwIdDrBLKMB2g/
         dgEuNmu920lLTZUnwyoAgarrHT9ov+RSm5ycxSR6LZKjHcDjrp0BtRhEueMy8fgrIber
         yh/BGEBZupwD2iU8OKuGXqo4+aUHl++9KPEE6JzgiX7otgekfrKwJOOeE2vBDK7WnN/s
         Zjcg==
X-Forwarded-Encrypted: i=1; AL+hErFAKFqTa/TVOhZTFHXSCu7+ErOO6tBfCvsvPI+tDtw1lIXlGKR27tWLawiabFyGiOXx6BHe+0dJZAon/jaJ5Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Xx4gDHQcPME0HAXDebjjDvi4/JBiCK4BBjUvJdZnR8lVq+cTy
	yXiUSlWIk30SUugm1P6eJOFwa23MolOUcyMd2w7z7o+bvS9pBt/7y3UD
X-Gm-Gg: AZFdTZc8qMxak94Vpy94lwLcqDR8LVCypr+ntdYFOotLrid8wv8vez86rQSWOb+r0g1
	Hv8pHAXMS2Gd24fNcK/8Br0doAFKy54h4tvAqC7O3jFqwbtNk4/P0rq4UwrrYaK8Jd4dr3LVl8J
	/RljUsVQPn3RNhzY6YY8/0iRbXgnZHkM/Eg6fEKm4daxaf1ocw0gnNI9S+Sg1c/4+0038L3gCIX
	2cNBa+pBgJ6PfSu3oAMgAMyL9xVrrQwWYLgcEim8vNqaC5L26qkhKmRbcV2p/ZPBWlkcpLAj2ZZ
	gcplULF2BU8dIrDYQxvVXAx36fGRTg/Y5xiIsvaiUJw9156zWoqfA3N2dln1bu5/nj7ahKl+dAl
	AjOo3877/N7yXg7TT1zXhvPodKpztcsvDTAIKiafbF308xbTINUdyu4kf/8qV81r55shR4ziHhO
	ZXVyNdzKavgIbqPOwLLuCKH09aYbDSsZiUVU3LboSPyJzY2O/zpLYTbEXw0834YorbKk3Str89D
	raNq2IHHfzN0kgaInJ9iNaSWA7Ytn3XjUc0TQe+AbU7dr9ZUzhI0vSy9k8UpYgaltCsv2RaEv/O
	vqobiOMKX9D6tEyR+ESMU+1J1I95iMZw8H0=
X-Received: by 2002:a05:6000:4213:b0:49a:94e6:378d with SMTP id ffacd0b85a97d-4a377f4f68bmr6704100f8f.30.1794935408012;
        Tue, 17 Nov 2026 09:10:08 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6d079a2asm26828762f8f.16.2026.11.17.09.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:10:07 -0800 (PST)
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
Subject: [PATCH rtw-next v3 3/5] wifi: rtw88: do not drop stations when collecting them for an iteration
Date: Tue, 17 Nov 2026 18:10:01 +0100
Message-ID: <20261117171003.1840491-4-mehmet.fide@gmail.com>
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

rtw_iterate_stas() collects the stations with an atomic iterator and
calls the iterator for them afterwards. It allocates an entry for each
station with GFP_ATOMIC and silently skips the station when that fails.

The firmware recovery resets the stations through it with the next
patch. A skipped station keeps its TX queues on rtwdev->txqs, and when
mac80211 adds it again, rtw_txq_init() reinitializes the list node of a
queue that is still linked there.

Link the stations through a list node in struct rtw_sta_info instead,
so the collection cannot fail. All callers hold rtwdev->mutex, which
keeps two collections apart, and no station iterator collects again.

Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-wireless/4EE3D95E-988D-4514-9849-9546CD49D8E9@linux.dev/
Fixes: 78d5bf925f30 ("wifi: rtw88: iterate over vif/sta list non-atomically")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    v3: new, recovery resets every station through rtw_iterate_stas() with
        the next patch (Luka Gejak)

 drivers/net/wireless/realtek/rtw88/main.h |  1 +
 drivers/net/wireless/realtek/rtw88/util.c | 24 ++++++-----------------
 2 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index 6ecbeb4ffe4b..6b26c517c738 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -792,6 +792,7 @@ struct rtw_sta_info {
 	struct cfg80211_bitrate_mask *mask;
 
 	struct work_struct rc_work;
+	struct list_head iter_list;
 };
 
 enum rtw_bfee_role {
diff --git a/drivers/net/wireless/realtek/rtw88/util.c b/drivers/net/wireless/realtek/rtw88/util.c
index fcd6eb1ab32a..3e8a520177d1 100644
--- a/drivers/net/wireless/realtek/rtw88/util.c
+++ b/drivers/net/wireless/realtek/rtw88/util.c
@@ -107,11 +107,6 @@ void rtw_desc_to_mcsrate(u16 rate, u8 *mcs, u8 *nss)
 	}
 }
 
-struct rtw_stas_entry {
-	struct list_head list;
-	struct ieee80211_sta *sta;
-};
-
 struct rtw_iter_stas_data {
 	struct rtw_dev *rtwdev;
 	struct list_head list;
@@ -120,14 +115,9 @@ struct rtw_iter_stas_data {
 static void rtw_collect_sta_iter(void *data, struct ieee80211_sta *sta)
 {
 	struct rtw_iter_stas_data *iter_stas = data;
-	struct rtw_stas_entry *stas_entry;
+	struct rtw_sta_info *si = (struct rtw_sta_info *)sta->drv_priv;
 
-	stas_entry = kmalloc_obj(*stas_entry, GFP_ATOMIC);
-	if (!stas_entry)
-		return;
-
-	stas_entry->sta = sta;
-	list_add_tail(&stas_entry->list, &iter_stas->list);
+	list_add_tail(&si->iter_list, &iter_stas->list);
 }
 
 void rtw_iterate_stas(struct rtw_dev *rtwdev,
@@ -136,7 +126,7 @@ void rtw_iterate_stas(struct rtw_dev *rtwdev,
 		      void *data)
 {
 	struct rtw_iter_stas_data iter_data;
-	struct rtw_stas_entry *sta_entry, *tmp;
+	struct rtw_sta_info *si, *tmp;
 
 	/* &rtwdev->mutex makes sure no stations can be removed between
 	 * collecting the stations and iterating over them.
@@ -149,11 +139,9 @@ void rtw_iterate_stas(struct rtw_dev *rtwdev,
 	ieee80211_iterate_stations_atomic(rtwdev->hw, rtw_collect_sta_iter,
 					  &iter_data);
 
-	list_for_each_entry_safe(sta_entry, tmp, &iter_data.list,
-				 list) {
-		list_del_init(&sta_entry->list);
-		iterator(data, sta_entry->sta);
-		kfree(sta_entry);
+	list_for_each_entry_safe(si, tmp, &iter_data.list, iter_list) {
+		list_del_init(&si->iter_list);
+		iterator(data, si->sta);
 	}
 }
 
-- 
2.56.0

