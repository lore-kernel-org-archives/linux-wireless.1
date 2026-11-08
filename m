Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794148074;
	b=LRKl/bC7Y2ltjpScuLT6Si2Rm0Akwht/K/PumsW/PvhpE9jJ7rWaieK0sdx23B/uz0t0
	 fZj72M8PnqntA3Q5obaiac83lg04iVEbDcCzyPFkgb6193eb68L1riBS3cg4Dt885TaKf
	 UKHbGBp3vQLRapBiAEzXBKzT9Ud4v/bLxMuu3ya6d4nEonwcsBFcne/RnJrdGYhWpOKqN
	 6kU8ZCpC3y4eEdB7TjY+b0cPqW3S5UW8rJs+clpPi5QmqkAhwIH8NTYwL6/yZsghiMI/s
	 A4BzTYa+WRqO9uJ25kBkMZdxWk0TX6aV38qoY6kv6M+rlRKsr+yfXrqAINKVbQ8Srig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t4Gwp/Nt7vNjWJ9ArSkVjCLBZ8+pUy0VbQocO5sogqI=;
	b=lNH/tRWKeyIgeRrfGnCyjZ7RqWnvzKPFgG2me1huk9pe9awxdnFKZ+2fsnvg6MLgMdAP
	 fKiCLNv9mYW2fD9IInFFqQej8UbnjHV7xfV9DTWmEhfk3HIGFhGHCamHGGftWDN8bHTYo
	 mLTW8YwiML3mummYP8X6sDtCCl7SMf65m/cxDYUue8OFmeywRICZyBGD7DkFO/rkcqxHl
	 i77B2uVoHYi8X2uAFqQ4FORF9m8jtzcUynzGDGw1wVwyGMXDW5W7cXYcuvdds8NoSQniI
	 rgabXlGNrobSS6Q6KCMeu7KMHUcu/jyFHxz26psGlMWx74b82umMajnBvaF5WY3y65g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0sirvTP;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C268606D806
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 14:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C268606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f0sirvTP
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3720addb068so180878eec.1
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 06:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794148073; x=1794752873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4Gwp/Nt7vNjWJ9ArSkVjCLBZ8+pUy0VbQocO5sogqI=;
        b=f0sirvTPLxWEvAI6+/UILFtSwA3Hev7EAdoFejnIOKvv8M3lqVw2mHz9svP91wh7+F
         GyHdLBgPH76ma44FH2Ht6pYj2tziSn88lK9BVipO51nheRsxIWCvB19f4ccek/wPmfQa
         J2Jb+DulIjhTItBH5dh3+Ra3ZMopGB5+ptFXaO+G15u7e8YNWIBhKehgdVWG90K55rpd
         LRy4bn+DhYKSHkH5o9pRDE7UgdirMtGWdsO5wbSHiwKUHM4z2QUr/WWERs5SWSMniDQg
         33P485V8g9IGqnxkm9GtbRn9cPI7HL79BJyC7igBdCF51tKVGVLgukB62cio4D0o7TOj
         sbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794148073; x=1794752873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t4Gwp/Nt7vNjWJ9ArSkVjCLBZ8+pUy0VbQocO5sogqI=;
        b=k+67UnZlO6ERLmUVLFOZ0yClm5Haf3FcHyKWz72R4caxz9OVdbcFuRJLBfzKKVHm4F
         WW3AZXAFQ/c+jXFLShHdfJklaAlVyzjdqmBvCJz1H77GDDTqd/q2NlGiiMtcnoPhkP8E
         Aq9MX27iDCZhk7rQDZmcOaITVoExm/X2aiiXrHlXKQxu+2g2/iRumd6J5NKFtnFd5uk2
         ODwmCOYtTDJuZWfDTYFCs5bRHK2W7ODeSJm0LqE8w27JbQfEOHAKMnlukLlZ6FG+68Za
         acOPyP11Dsq9I1/UOnCbzQ0mNpun0C8kFbQNH3k0TCvdjb1YIzdS3DkchkOREuewrIwr
         pVDQ==
X-Forwarded-Encrypted: i=1; AL+hErGqyx7WsG1F0j3hK6k2fSmHLIAcSHEX7okWc+hz8JoSUOYElabd95lWXHqS8T1Abrp91I3XZTJaw5X7WKsRGg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZRwlSWleNGHo7xI7H+IVViZgBzp1zLUvr9Hg2XTqxKh1euY7B
	uksa9wYf2s0L13e2GGG8epnTRzHp9/vKJLMTnTD8/oldtIELdyktqLvY
X-Gm-Gg: AYBFou3z9/8ExFOzGPevxfw80Spu0s2M24Uv/Qq/0/43lhlYPYR8Faa6S2hRNJU6kAt
	Z4NRDY/n1zADceJ/Qht7l+R4ydbnnAupRWzFSfJ4B3eeJQJYolSDnRc+6JCmYrJRE6Uj2seMJpL
	iZyq9QXO6S+XHEgjPCgDyqlxIDKF0oqa+rIAcHDwEAxOdidcpo2D8WOAaP7Oy0iJ/zdI+Gdl0AF
	rnYXNYpABzfcptRIe9fGJK0vFMErQpFQvJlT5qeES9rC4a9mCi+XE7d5xrNw730oT4vtEwaowI/
	EGwVPP11hiBPrVRLlrnqWS8lnYPJquKOhh4A+bNcvW7+7qEwOi8YqTxaOSJmELRSQGG5R5UjdH1
	am8K0Ibd1v3U2qMD7pEdXa4FUD/QHK9GjiSXwRUiPj0742JTr4E3ITI0w+P6k1XkUViO5A1GzD5
	NJvxEPyBtgHshWdtRMM+WcP36yGD7tveAJ92/vOtxiy12qWh01SVw14/+6DXa4YtFRBQho6M/NR
	OQ86VRrbAbzFJKKkn2WACiSDPHzrU1A8tZi2yJtW9PBoiZdWviL0sx0XGmdmDJQAVG3LaP/C3jN
	X0VRmAA9Rua/+u9Thmd+I8q069u3In7FKYU7tWw=
X-Received: by 2002:a05:7022:b0c5:b0:1b2:4e79:bfb0 with SMTP id a92af1059eb24-1b39fed4817mr2154779c88.23.1794148073261;
        Sun, 08 Nov 2026 06:27:53 -0800 (PST)
Received: from xploitoverload ([2409:40c1:6412:e5b:5516:cd42:6c8f:c918])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375604109sm7141347c88.10.2026.11.08.06.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 06:27:52 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com,
	luka.gejak@linux.dev
Cc: kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 2/3] wifi: rtw88: skip already reset station in rtw_sta_remove()
Date: Sun,  8 Nov 2026 19:57:06 +0530
Message-ID: <20261108142708.489067-3-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108142708.489067-1-skalpesh942@gmail.com>
References: <20261108142708.489067-1-skalpesh942@gmail.com>
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

During firmware recovery, __fw_recovery_work() iterates over all
stations and invokes rtw_sta_remove() via rtw_reset_sta_iter().

If recovery is triggered concurrently with station teardown (such as
during ieee80211_set_disassoc() where mac80211 leaves LPS before
removing the AP station), rtw_ops_sta_remove() is subsequently called
for the same station. This causes rtw_sta_remove() to execute twice,
leading to a double free of si->mask and an underflow of rtwdev->sta_cnt.

Check si->vif in rtw_sta_remove() and return early if the station was
already reset, setting si->vif and si->mask to NULL upon removal.

Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
Cc: stable@vger.kernel.org
Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index f7708ad17b6..a74f199a93a 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -384,6 +384,9 @@ void rtw_sta_remove(struct rtw_dev *rtwdev, struct ieee80211_sta *sta,
 	struct ieee80211_vif *vif = si->vif;
 	int i;
 
+	if (!vif)
+		return;
+
 	cancel_work_sync(&si->rc_work);
 
 	if (vif->type != NL80211_IFTYPE_STATION || sta->tdls)
@@ -395,8 +398,10 @@ void rtw_sta_remove(struct rtw_dev *rtwdev, struct ieee80211_sta *sta,
 		rtw_txq_cleanup(rtwdev, sta->txq[i]);
 
 	kfree(si->mask);
+	si->mask = NULL;
 
 	rtwdev->sta_cnt--;
+	si->vif = NULL;
 	rtw_dbg(rtwdev, RTW_DBG_STATE, "sta %pM with macid %d left\n",
 		sta->addr, si->mac_id);
 }
-- 
2.53.0

