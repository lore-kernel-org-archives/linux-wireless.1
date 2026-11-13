Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794541653;
	b=FUF1QwSTT2QES30UhFeaoClowUIO0hrzm/zcLtDoVx/oi+2Wr0cvoPNAdQws5xwXdqJY
	 U3Tm8Av9yqxdlTnYb9UssZl6sRhyupY5iMZU7n6N/ZYXUXu/O2W/PKt7v7Aw6o7vDswnA
	 ikhPsBCJoxK5Ruk+tTsrHSG3+1mZlGVXYRi2nJwqRWHfEw9lzgRsj1dix0Dm/vNcLlGHw
	 bl0RIJLiQOQVkq8VRH1XqmSMeQbSRs7od1cSGEKCSKILkiID54+Q0z0pOZbmciFsbwr+7
	 vmTJZrswNr/2Cr9gTbTlaFS44QAAIw0g6y2TeF9lEP5VLySOVfHUKaC9hixJSStIVSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794541653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3LzhNI6KAXXp1Khvfab5SqGE5C2/yptFBtaVkPjOeYM=;
	b=Afbirbofl+IvxPnsgt/DyJ9T6TN4MaEOBJGXNhKb9N+Emg8sEYjan2kLFGWYQo2rtZiv
	 bIgOMgf1L2/2WxWdunZ4HwcMueFaa6PMGawNgOe72mvmZ9IM8RtXs2HWFDce9RQ7j5YWn
	 d+4SVjd9YuVKxaGotdxOscoT1RaINwABG3Wo6Le+slwuFROr3miDtULyDWtduZCxkv9iK
	 JYC4sIV3PTg7siwKcoL67Fvjlk9/xz8zVMMZRjr+ZcW/SKedbBDe7DakFjY2lGXBX+CCu
	 Ls/jvwGU0yGQIw/lKBRiuv77ArE5cKqC2NzGAzT8guTsA1uxsApuIWt6N3uu3JzdAAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VqUbI+oD;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB31B606A32A
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 03:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB31B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VqUbI+oD
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3791619605cso1175486eec.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 19:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794541652; x=1795146452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LzhNI6KAXXp1Khvfab5SqGE5C2/yptFBtaVkPjOeYM=;
        b=VqUbI+oDiI3JnOrqc33DlrRxtxm6kkrrCCNbctrscECoVoYuCXiTX/nr/klre+H7tp
         dy+/gTshNxxHC9B4FoaqyTH5xuMYTIeu8EByW+rPKPFNHAmEkjuXuo3ZLBv94SpOHiyr
         Q3zwM7HZcz6hYnSqpNqW2+jINz9/bmjg4Ot7dd3pOUxhimNRYYuMKHtxR/3v2TDr2rQF
         8lc2z/n3zBF7z3ZZjHcrH25M0jt6Zj0TFJ0DPOKYVnw6OqXAfr+1wXj8M9MjBIVRZpX0
         nrvjNOVgaoT3WGrTSlAEQDWWuBwXTIM5SQxBC+WFSAXICrUNTwGFYAe8b+cPFAXquJEv
         qW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794541652; x=1795146452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3LzhNI6KAXXp1Khvfab5SqGE5C2/yptFBtaVkPjOeYM=;
        b=n7ampSq/6DLrTW7lzi39obqEPsKGSgi6Fq2te4H1GxYbb6XohQam8ojnWHlS55mbWm
         fMaopetvp34ceA5amLxyMDn2A0GUlu4YRlhMG/Bv5OUsiHMoJS8eUUoO97VXhDSMDegN
         MziqW9owK1EDwdxPZZhAioL3lE2xUbxiKISLU3YPmI7U3Hn5XHTqNeOBxyjdbSQdQQd7
         tYTmmH+/bNFvy4n4ZXqAlAsR7Bh+TBpB/rGhm8ZY8PBwDD1IPxbESpId8k3aOu9Yaqjt
         QOZVJ3pgQ8s3bSJsAim/Q022meJk0Pvyvo2Cm4obPqkeFJ8iy5dTrekMpEKOSeIe0jPS
         fzEw==
X-Forwarded-Encrypted: i=1; AL+hErEZ5HY69/2U2t74ltsivPLl/PsmkI0xtxCPV+7C0g/dqQO4HSIeEXGPpBagNWAFH1X70Eza0D4vjeuEsA9vRw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+5p5L/M046u2tLTeaeYSm2gLljPD3mWXPQ774fDNivDs1p8FBE
	vxbjlEeGSf7VCA/J5jt/lSpggsUN/WqiyaXpiApwopCXMSclWNNP5+PA
X-Gm-Gg: AYBFou0bI33XxSvAv0eTEpjxXXF5oQtnJtdhGvhrfkUt6duyRqA47WqSTvYLtcMRJDh
	a3CLfONPnTzf7jTT57G0Uz8cJBrCkepiznftbLlERHlA9P7dph3/fld8lYdeBFuiq1KwKAgkyAO
	V4yMe2tqrMMh4rSENll3RRwSFE7vc7mbIgmnrHaIlDVQdUYmCu29geQWekrP7eav7BS94O9iCLu
	j0R1C5ySDXDQxlqpWH47E2XjMoXulIWE7LBvZ+n3WXsf8a9hJnRoMg2DArr3JRRuj4Ao7MLOkyq
	kcP227nhOY0flRFNFxXq/5tNX/bvkYwLGy3chEn24pdh7ob44w8ialo+oY5+12yaPBVId0a6Iqm
	l70NemiIt7MwaCmZ9XOGDgJdyrr/PgQBSk2HL5icM94dpwQfXniABi1g5iTzyki+KOBLyWX1eKd
	9eS1F1QUGk89vmBt1S/BobqP19yLeXWVIQQRbdfNG1ze3DI0kpqN0XOYE6F0PXiU/NNppQudkxQ
	npYeGjxmTzZXbXHSIKn9UY/00RnVZqVV9nLYLOa8FfRCoYP96YAjg1vaEp9IK7y/79Av39ovx14
	a1erFZR8kAidMHhprWp7lNgdZuZkl4ZxO5iFuMKHoA==
X-Received: by 2002:a05:693c:6219:b0:377:1ad4:1947 with SMTP id 5a478bee46e88-379659c685dmr921272eec.6.1794541651747;
        Thu, 12 Nov 2026 19:47:31 -0800 (PST)
Received: from xploitoverload ([2a09:bac1:36a0:120::243:8a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm2882111eec.12.2026.11.12.19.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 19:47:30 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com,
	luka.gejak@linux.dev
Cc: kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: [PATCH v6 1/3] wifi: rtw88: clear RTW_FLAG_RESTARTING on stop and start failure
Date: Fri, 13 Nov 2026 09:17:02 +0530
Message-ID: <20261113034704.21283-2-skalpesh942@gmail.com>
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
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
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

