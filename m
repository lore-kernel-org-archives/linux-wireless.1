Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794148068;
	b=YZ7vZHA/+2+edjk8t8DtFRhUzRfBAWK5VwhaURDjIYSItoK2yQVLsx8txOiup/2dvjHY
	 +ad9lP9I1e+kYi++H/SJMSiqwCt72fLMiPMwj2/ZUgZOZEcNG603zClddaX2AoVh+Uqhq
	 QH+kUgy1v94chIS6IZgISRyeMljj2f9b3gSvjvw4Saj4z87dxuYjqy9fhuCGZLWh9xwP3
	 1055xLaGbZR9tlXpS/x+BOO7GawI4OeWZKs8QMBGJ/upkSZEBW5SSGkyp99PH6g/LE+im
	 V9Jp5fRNpLx6/0+9pw0pFp3cStRVeoA2W7oRxY+S9N4BG7pWqpGe9/4dZW9TGo2jAdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lHv1Jqi7GXywnb/nW9IKsLC85UK00ELbr2eA4avD0lg=;
	b=xuDj5m1422gyxGBHi0KSmaTeLZWy7fIuF19oC2ra8dm3nn47XiSd/i5wZpdkfRvSaAlP
	 5Ua91iTsnWOjBlt84xv4Jzi7R34tQ4Vu8U4sSsXNu2vSiCFj368YdqYSghIYGXu8ZJ3O2
	 a9xzZL8f0Pi1tLh5PI5sqdJoIQ6jB2pSfuIp+qYC4sDa2IA3SVQT7S5Bj1lLyJRUzGg0Y
	 8td1kEiNXs75IGLfUV8Do61WMyJ2Zg6HUHDmGBIZ47nM8c7zTLBVFf7MQr3k7ObVYEeQp
	 C3/HRuwrwezL1AIkpQ9NATWFTOoXOJN+z5IFG02YmZBNn518EKTdh/Vls3VItp9Z7pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vMSfCDAx;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B9C606A32A
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 14:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98B9C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vMSfCDAx
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-170135e43c7so164076c88.0
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 06:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794148067; x=1794752867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lHv1Jqi7GXywnb/nW9IKsLC85UK00ELbr2eA4avD0lg=;
        b=vMSfCDAx7Gttf61BlOYJfcVYE1BYD/36paanqdJe3rmKlEi4ZLd8/dmhbIEy8fawvX
         WPi+isqj5YWOpxnr3Fslgn6U+E5e2Fw5Ya3BBUVycQFz+YU+S3LyeS2zVC+laV4rl7Ln
         fAY1OEc1HoEOfQo9jYGJAEEjZOCKCy8rFLwRT15fXJd2DNMTBZ77w8s9Fnf6rAPxWiCc
         AqGJZgeB3UspKNZw2CeoaKSYjj1hTfpfX21Mfms8osbGBQsgKYzzylTEEGajjihXFbxm
         q7TgSnaELTqObetYL/2Ld2vtzOMoUeJoImj+S/fS+1nizTLQZfGq7I6WSHDFm14qglUt
         8tRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794148067; x=1794752867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lHv1Jqi7GXywnb/nW9IKsLC85UK00ELbr2eA4avD0lg=;
        b=csmDJSftq7AFU+mDGlyOMiR6bAU26BEVa8lyVmfIvtcvo9U4YZvBjVlIDs5+RDHgxy
         YVztuAMQS+3OvrLTJMr9nq6W7uayqLlMh47JJB50g53/NF0Iv84pbYWNHCY40DX7megc
         1UQhHhqC2GLlUI3j/n4AiTbTnk9Rh0OkGDQ75Oxxl5K/RhPqpjR9I/8zxnyd6KNjmBR+
         VX4qj8sIDgkVjB89ddvakx0L4lyZbrFZmjDuDfYKTvuq1RrLkgRJDrwzrG0/x6PZZgCW
         YH19ip8cUjbgtNvbCJYi5xSnevJw7OTWl3haKYFmKPXAz6CPo8ryW6V0xTpcgjWuIRAY
         FBZg==
X-Forwarded-Encrypted: i=1; AL+hErE6jkrk+iehjYgCUbmqJEV5654l2/Sl1zPuhNiXdOt2m19c1YketPVOcH4XHBAONnRGIrshXQbM+lZFdPYomA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/4vTpFOm4aKUsNweJrFOkzhLR6Glg2ANFi2kyycSHZNZmD4ZDa
	3zGTkfRSEnYIIdGlPPgIxcXfJDI87rl2nTu1uBCW+TdgBflFmAPdpwGU
X-Gm-Gg: AYBFou3tgK1VpTK5T+0jx3SDGdbyy1IUbfu7DShhFMKSdkR2oTXdpFKm2OfNQK//YCk
	SXlLz/1I114F4YzPXMczk7ASiGIYkDOtsWXvu8svWCzv0hj4zmidOawbrIejpJ8Tnleb+ng5TPr
	ADjaNQIENBlYxqnR5266ci8pa4J2UNjMTvqjbdVKjS6I7ZMQ62XHWiJKf5N9oWIztFH94M3elia
	0kCFAiOV6vpExuJISd4py+BxBHnFAMCsRIvIwquyk3FJUke7ER7qAUDhfGLlwK9ni5SolYq9BYO
	kypRINlG9rKHGK6rr8JW790WOa8Ds+AoXKyHW+BREY8QlX+p55hl+mSU7I02UNqR8QkR4T08cjC
	DZ7vi695dUVSs5LSTJY/R1RoiV8fUKG+ifDHN6GaLdFQsWokvtydTmTO3L0BgWa5uiQ/EiIO8J2
	yGnSOvG9PBUCWhmBcpUL77cyM6GRSNslLthNpVlhezA07UEyi+34X7cxzG0+Hdx1ZTS39FPacF+
	0G0V16JCCFycUiQUUpOKwOXsMWhQGsor5pLYAfxsq8BO2kEGpEamItBD1IiyXD5w1FVvC46KCYq
	7q2WmNZ3HIboM5ZUx4w7dIy1a7DTRlW2l/o9yCo=
X-Received: by 2002:a05:7022:1701:b0:1ac:1343:fa54 with SMTP id a92af1059eb24-1b39fec8a94mr2165816c88.14.1794148066707;
        Sun, 08 Nov 2026 06:27:46 -0800 (PST)
Received: from xploitoverload ([2409:40c1:6412:e5b:5516:cd42:6c8f:c918])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375604109sm7141347c88.10.2026.11.08.06.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 06:27:46 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com,
	luka.gejak@linux.dev
Cc: kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 1/3] wifi: rtw88: clear RTW_FLAG_RESTARTING on stop and start failure
Date: Sun,  8 Nov 2026 19:57:05 +0530
Message-ID: <20261108142708.489067-2-skalpesh942@gmail.com>
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

When mac80211 stops or suspends the device without WoWLAN,
drv_reconfig_complete() is never invoked with
IEEE80211_RECONFIG_TYPE_RESTART. If firmware recovery was in flight
during this transition, RTW_FLAG_RESTARTING remains set permanently,
blocking all subsequent firmware recoveries until the module is reloaded.

Similarly, if rtw_core_start() fails during drv_start() in a recovery
restart, local->started remains false. When mac80211 cleans up via
cfg80211_shutdown_all_interfaces(), drv_stop() returns early without
calling rtw_ops_stop(), leaving RTW_FLAG_RESTARTING set permanently on
hardware that failed to recover.

Clear RTW_FLAG_RESTARTING in rtw_ops_stop(), as well as in
rtw_ops_start() when rtw_core_start() returns an error, ensuring the
driver always exits the restarting state on error or teardown.

Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
Cc: stable@vger.kernel.org
Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/mac80211.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 5e40cf06a9e..ffd86f08185 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -57,6 +57,8 @@ static int rtw_ops_start(struct ieee80211_hw *hw)
 
 	mutex_lock(&rtwdev->mutex);
 	ret = rtw_core_start(rtwdev);
+	if (ret)
+		clear_bit(RTW_FLAG_RESTARTING, rtwdev->flags);
 	mutex_unlock(&rtwdev->mutex);
 
 	return ret;
@@ -67,6 +69,7 @@ static void rtw_ops_stop(struct ieee80211_hw *hw, bool suspend)
 	struct rtw_dev *rtwdev = hw->priv;
 
 	mutex_lock(&rtwdev->mutex);
+	clear_bit(RTW_FLAG_RESTARTING, rtwdev->flags);
 	rtw_core_stop(rtwdev);
 	mutex_unlock(&rtwdev->mutex);
 }
-- 
2.53.0

