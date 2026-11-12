Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489275;
	b=wgL9LbGZNXwN0qsGOpI0L5DZ4g70pChi6VnBUr4eUs58vQWZs6hEDR1mZN6uCnBqglyO
	 QpDnDtjsVaU3aQ870jwVTf1Mgv0YtfFZjOqu7cl0cUqoPOB55Iy86dnPxmoziQ6PLcrcN
	 UDB05KzMZyU311ahauXjMSBMbundoz+ygopmXU7f8wfStMgVWGj8f0K8S07k+Dm81UZh1
	 Cq5mdUAgP7aToFdRIAMSAXM9/b2ZBsWjl3eF1WWcjC4gZKP4LiW8KkC2nGz6WMzJysL4d
	 6Wyl/cRgf/HfbH/4MH96fiTZQsKC4f8KYw2MGedVa+DDoixKmlkUgDvl0d/DkwlhghQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lHv1Jqi7GXywnb/nW9IKsLC85UK00ELbr2eA4avD0lg=;
	b=UaSu7GulvXQzSldu5v0YnygmWMSCyTcmlIXKEcbzgCuwVc3HSTwMgF6IMaSkFMX4PYty
	 DWXUIP0Uok0yOmwNGEgtyli/rNe+R+2FNHsShBL2dxUa1qj7ZTorFYaTSoD//E/bwWB9I
	 aTbuQoW8WrChdQXLaVTsFvPi2i3JYNMneMvEEljPjPRMbnN690xuWWhp7ruk0PuThfck5
	 8+Or9UyS7okkcpARRdUexB8cG1YYig6h+vI0PL6e/SEEStSchYwLiCHd9AZv/YNCR8+w2
	 OvOKRjA5neljAXXVKlNblf27rxTeTo6jqTwxQ3K9XIV0XU4hHUvEd1jJF2wrg4GpBEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vYBPTTOm;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608B860A2621
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 13:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 608B860A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vYBPTTOm
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-18818daa3e7so397097c88.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 05:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794489274; x=1795094074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lHv1Jqi7GXywnb/nW9IKsLC85UK00ELbr2eA4avD0lg=;
        b=vYBPTTOm8GleGcw3qfhCn+TvP4oQRbhRiMedd7yb2IrVyeLBuOipFOMRuHNpo9eWGv
         6eaa7YX6ALpVeFl2m8JQ0XrlGMhF5Hew3fIsCPur/okc/Wf5WR7Z1oQVR6YONREOvwWc
         z7TtZc8HUFyEN4nFniimnXYo++Wn3Go9HVC/Z/msQcVeZVG32cYY29HWaeaZvLlrit6q
         8eVhqmMwmipFQpnulFnp5Gdotg0YRvQqnGZr2lOIb5WW613M+fXyzVEVC3VMpsaCAKYn
         Q/KuPfOECxbGGQnYD/cWUnR/RADetbdRSUR3KWvPrOkhDfI1upFpdSUHfVh5IxgOjO8h
         PyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489274; x=1795094074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lHv1Jqi7GXywnb/nW9IKsLC85UK00ELbr2eA4avD0lg=;
        b=Mh8R5Lqljcl6jIBYGon1DHLtZMEt5XE+6TiOP4MRv8yn9Y6cgZUiSdO0V9QQ0zZyKZ
         76TAfDdPQakpoKiizjCltGBZAezzlKx/4X/D4v9CtF2yw6xNAu9/VsPbwIm3wxi+kybZ
         mIsAUnHi1FrRXG7LkER0XT4aLLk8Wnovt5t1vobZDNIJNsCWm1PBNCEy14gvTkpx9Rpv
         s+u46Z5AdWPjruijALmM4o/Y6zl5lnFrIdJwvwJELZitExQoMjeUWTtKdk+7/QGk56Ts
         ocEs8Y9xuc3ElFZvxOqULeLHlpL174EU4XjcS5WYLaAhtkP4uBkx4Pw9MWl11RKW0HnZ
         EJug==
X-Forwarded-Encrypted: i=1; AL+hErEFcWEEU3v7GN0R+K0ExkbYC7u4im9zp5JiEAzikmfd1KE5J29+BLpVP6fZcdbIXZUki8yfD6bMAg5magBw9w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+vvc52genzy80MImtM4X9QecjF261g2+nXkAk0nNeaNZ6DEVm9
	Qjwh78E6kSXJOCnMf/ftPozQOI3ppB1nNo7KfCV0eu6pdYUjfCfsQ7H/
X-Gm-Gg: AYBFou2OiG4tc2ke7tvLFd5R4gF2VNiJ+C9het+0CrwWAU3nXryVOcKGjFuPs12XWod
	IpHjz90sWjyP+/nwhzlbkF+U5LWCHEh2AzO//HTLfUAsLwsapx9o+RVRIWodKZ5LVv14rfdJwnL
	92orHLAWJ+k8iFLoVY77PGwfUMSbScma60PJitEX1M1R/WhP1kwrqh29tOa9vy+jZMHTA6ioEjA
	dz32jg1AsjFgkAislRs4jgBxBp51XBPS/lSWMTII407fW/Ec5PNeF6B350kswyjt/210gqlSwmI
	k26G5HFWQyjW5mUGK7jGiHBYg9Q/7s2Y8/4lMarmsRCjxJad1AMLNEoILoRph1x0SpQifeRcKS9
	w98SSn+oobumbHKAuzmcsrvEamErmN7d4calLQC7G4xOkIkWg7fobVVF49ak5Lc03gyW0NUX3wL
	lei4Xnknkn0rDYrP8/jorzM6W1wDPYARs4AhITKsjDjqprII2WRpeFrhT6j36qib5r2SGWJCRJm
	UixGkTYL2pEfB+aiGLJl+Ip447QAH+KGTgzm263sclZXEoERmJQY+iXwajLFNor5cDxdqPZ3G7i
	vo5ZaMh+H/yT3AVEA6M4OQ==
X-Received: by 2002:a05:701b:2402:b0:1b2:6d4d:9d8a with SMTP id a92af1059eb24-1b4f5ea832dmr1835486c88.2.1794489274209;
        Thu, 12 Nov 2026 05:14:34 -0800 (PST)
Received: from xploitoverload ([2a09:bac1:36a0:120::1c5:160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b48a9c34c9sm8985969c88.4.2026.11.12.05.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:14:33 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com,
	luka.gejak@linux.dev
Cc: kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 1/3] wifi: rtw88: clear RTW_FLAG_RESTARTING on stop and start failure
Date: Thu, 12 Nov 2026 18:43:59 +0530
Message-ID: <20261112131401.236433-2-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112131401.236433-1-skalpesh942@gmail.com>
References: <20261112131401.236433-1-skalpesh942@gmail.com>
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

