Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794541658;
	b=zderZKDwEDYQAZenSS2GUGjuNCOJ32KLzog6F6PyBO6RTJyX2l8MJ8dgegtNYezUO0Mt
	 eQ0XkRbKh8t7xJB0KXtJMDBPZ9XGr8G8iRAORQkkFRC27exuAbJ0McTLOUGbQUfou5oTB
	 OUPo9kG4XDkhhZV1qqAqsR8eUbUXyiFq0Dn+J7Xfdq8++di6mozIc5Fc6m2DkqyttND/l
	 OS7mOu0ZU8OtoNHRzam3n2bnG9C9Opb1hEUlapEaer4lLKmognlx8AiCOGhA3v/S6szBX
	 DgxHF6i2FjplNHsT1mQdfc5JQyj91wtQWtOHAoR/nsPG5VC4t+6KYtml4dQZsPRf8kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794541658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=krFGc39cDQc6W4RIn7CRVnBJgRk5o9JOSMsGfSyQOaw=;
	b=kfwkSj622kXAqAq5Cldc4OzSprZwMN28hboGHhNMYiLIZuNon9dDfgJh9mCaO0ULFEZI
	 StUwn8M+eHFoHjvOqwwHtyCUH29VlmNagorELL4dPR5gWrlFvlkcaFD7TfXDWVRpNzuUW
	 5ulBN6udczGTzQk5aCpUyH9jqn9ED3cW0YnwhwwIYLpp+gSuGE5MPdCrXN+OViPAfe2wV
	 8gtpazLYYEwPeDBjAQgHmWIAUlj7Yn7sFBHhG2ZyXr6gMDuP+krWGrn4hVgM5pajNhdef
	 fE+wRo3rK/dYIPBvvLukxr7YW0bGosZ3JnuV3l43YDtBKy8OLNH806Xbk9sHz3/vqQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HBSC0mJO;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90B1606A8AD
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 03:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E90B1606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HBSC0mJO
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so691449eec.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 19:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794541657; x=1795146457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=krFGc39cDQc6W4RIn7CRVnBJgRk5o9JOSMsGfSyQOaw=;
        b=HBSC0mJOXL8FSFnSuZAaqLFy7pGovQkHDUeou+qbg5iQMpZ0ySKPLyoJj4R+f08bPT
         GzX+yUTfUhqHBSYFiN/E9U4bmqb7KFw+aZi3oGAY8OZ7dopI9t0k9X4ah0CL9vjlOdJ/
         c5C8KdDrXJSxOGZJoW+rjoTCglBLOjGo7Uyulxb0dD6E2nKr5iZ3OiDE3zC8azf3lfYP
         GxU63tAbRoSLuPxv3SleDfEWSVeWTBIcxovI1WnGuyf/IrBYWbByPWBjJKu2kwbpPGTf
         eV846oU0LuamoHiAjrrwwiNJ4IjdoFxid0bbur/pwnttY5mv3kUz3ie5u0K+9XXgoFpe
         AlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794541657; x=1795146457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=krFGc39cDQc6W4RIn7CRVnBJgRk5o9JOSMsGfSyQOaw=;
        b=FnUJdTgaKoVOGrRSNE7sLZKwgr3/6Dk/g6Sru7H0N3z2EVbf/alIxsVXRoYi60y2dx
         XS52AC74pjxhr0GeCv1l5WyyPTotevpIKEGvi1t8divp73G841lvOQ5kn6wvDxKhnedv
         ixlPchmL2J9w+BSNllBGXd1iEQX9Z/cyXqLXvkvv60AikfHBVjiuFWmU/RSgD2JgFIdU
         l5DRPeft/pB3rSDo//hr7p0DVV69QxqmlGF3OyyW8X2VvUASGUoG0Vuf2voFgqsrLULm
         +SIq6MTMshzIvEtPzShEsmBseDPuqdYD1LP95NtqNSgJEAjO9fF6/g2WZ88O5e867SKm
         p69A==
X-Forwarded-Encrypted: i=1; AL+hErECMyQdSF2NmwBrO+EwXvkMWDNrTqyiRngaCYva3DoEG3IlBOQo/dRG+pi0nQeLsyj3djYG83Z1p5WEgUfT5g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9jGmIZtVNDwcW9DhHarbRwvLHCPYH8/Lsje4VoSsiWwsSWNBMx
	9PNS2Pj/O0hU+3GP0s6vVDFJccp6b/6pXzdebeqbqzDb1/46NJvHgBIt
X-Gm-Gg: AYBFou1TGoH07XyW5w5hV1iG6hnX6lRgLSM63JYW1soM195zLuGMFoGxlxtDNfH+LA9
	px2mTw/gpcUoRxACK/6zbk9HQRD/xIdBl2kuwTzEnaDuPe996W9jUCxyL9efCTDAbfmJpuyxyxP
	mm3XvRVWM4nQ9V7M1uNHUtHA0rBT8JF1iG4G6yGWwroHQG0YdcHRBTNZm9llxB8hclwmaqNXbCc
	E7nuR7j5FvisWV3G1cI6cZQT1pn7wjJvaiKt2uf1ITqTg7m4h+d9SXXPoQvTOUJsIWl/Abelb/+
	sfMTVnBZQYXj9cKvuLT5syF8W8Opu1+tvh5GeC1gvcmMRzOVWmUyCXCwrqT25+bFGoY6xmQ0O6r
	YjFH8hpxPsH5Sk4UVM1rvE7n1RBpxCXgvqLBzMNm30J/FBgrB6Pajw49pZseSx43+pfrl5+zoss
	hq7g0wmnvjcXiNag6h+WayPz64MYLqXKZloQaakNK/pVIOqYBof9ik/aIIV59T6GigVSuQoJNew
	8TpIi9OW6icM8YbznvDADL7AG0T3BdGxZdy/CAl7SFC8NsLrvM2C2ApaO9iTNRWd4cvX6Mub7hd
	MbAl/AHg6jI8iKr/ySedXRkb/o7koom4AJ4dXq498w==
X-Received: by 2002:a05:7300:e9c5:20b0:361:167c:2364 with SMTP id 5a478bee46e88-37966e3ab7cmr1252984eec.8.1794541656922;
        Thu, 12 Nov 2026 19:47:36 -0800 (PST)
Received: from xploitoverload ([2a09:bac1:36a0:120::243:8a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm2882111eec.12.2026.11.12.19.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 19:47:36 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com,
	luka.gejak@linux.dev
Cc: kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: [PATCH v6 2/3] wifi: rtw88: skip already reset station in rtw_sta_remove()
Date: Fri, 13 Nov 2026 09:17:03 +0530
Message-ID: <20261113034704.21283-3-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113034704.21283-1-skalpesh942@gmail.com>
References: <20261113034704.21283-1-skalpesh942@gmail.com>
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

Cancel pending rate control work first, as rtw_ops_sta_rc_update() can
still schedule rc_work after the station was reset. Then check si->vif
and return early if the station was already reset. Clear si->vif,
si->mask, and si->use_cfg_mask upon removal to ensure clean teardown
and avoid a NULL pointer dereference in rtw_rate_mask_cfg() if mac80211
re-adds the station across recovery restart.

Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
Cc: stable@vger.kernel.org
Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index f7708ad17b6..8e62d38a269 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -386,6 +386,9 @@ void rtw_sta_remove(struct rtw_dev *rtwdev, struct ieee80211_sta *sta,
 
 	cancel_work_sync(&si->rc_work);
 
+	if (!vif)
+		return;
+
 	if (vif->type != NL80211_IFTYPE_STATION || sta->tdls)
 		rtw_release_macid(rtwdev, si->mac_id);
 	if (fw_exist)
@@ -395,8 +398,11 @@ void rtw_sta_remove(struct rtw_dev *rtwdev, struct ieee80211_sta *sta,
 		rtw_txq_cleanup(rtwdev, sta->txq[i]);
 
 	kfree(si->mask);
+	si->mask = NULL;
+	si->use_cfg_mask = false;
 
 	rtwdev->sta_cnt--;
+	si->vif = NULL;
 	rtw_dbg(rtwdev, RTW_DBG_STATE, "sta %pM with macid %d left\n",
 		sta->addr, si->mac_id);
 }
-- 
2.53.0

