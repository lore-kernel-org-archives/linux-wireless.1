Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794127939;
	b=OYstpan5Dt8CGyZ7gzAX3WI6QaZiWRnktt9CbAv8YRYkba6ust4foOut7zTh7G9V8gtl
	 8vzs/iACeQC84gxusMEXZMaNvaOO2mivLdiKK2dasWrzKT8DZlw3JBv3RWzcf5JHz/dg6
	 l1R01FTP3wxOLHttfTP5XPzuGKNXovRZ+yZXJvjGZHryGDrtoFmutcplXIDJcJUSiSMKL
	 J+XFTeMLdxD/4UBXVSdQQDBDJMQh6hTwx54oNO9tnzYoU5m0pbwiYrgLFUCMIuE7vhm4m
	 GWNoq4QHWb8fbgNZJA3yU/YYp6/AVaB7F80pVVN7OA3A0N4gVP7QXuqu51axM7wOgaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794127939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dNhQGc3GPqKfSByEN1B7roZuoogyK4AK7uxo1IzV568=;
	b=oWtRFleswjebUTyfjPsUWpVWhX722eorJI9zDQ8779EcnP4dDnax5LKhv1Nogxcwe/Eh
	 c9LTrW5+QrxZ/ab2wVfFw3E+cAmJ4bBwY99thImHh8SoT64WKYzIsamfRCJkz+j+0rvLa
	 iBjnlRM2+pJGQNySh+sieyPiL/bihbIfYn2mcmQvJB/d+7xs+Cp2yskOvh9rnyamzDSkg
	 fNYeCctFLu6/67e5NmxC4QlVIUGKNr316qmutwvpLnQ9jJ/rcM149IZsUhvRpFPgkTZLx
	 oGAcIY2tEGczbewJmsMPSbSnkyEPilkWiFby56cxfHeAwDFn2Kz+o+0oaEM3wO+qSHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t6nUdRJC;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429EC606A31C
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 08:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 429EC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t6nUdRJC
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36f8cdd30beso724672eec.1
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 00:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794127938; x=1794732738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNhQGc3GPqKfSByEN1B7roZuoogyK4AK7uxo1IzV568=;
        b=t6nUdRJCrrmLJvKtxAzPiaebfS1X9UZEi1vO0XMOtoqyCud0B7PYNRU2rBVcCg7zFZ
         znGnhe7xhGV4o8PnHPYf+qugcDCI4ouyrbXSU8EeV2spPcoW5mmNVXOGKigOphZSpdik
         014J/cwsGLfAedkuea2Rwx0O1mBcXS5PXX28bn580YJCqWfKx2T1lUq/V3GF+knhGrwZ
         AenQ4R+WwWZ6CvzNoinqk3/rsV0kIgFE/MnhrRmuDrQhzOnq1e8lAJg5A4fgoCyDI+Hk
         1EA/JRvXqiK0nekj1OYpqRAoes06dZbWjabhtvJJZJoMQijz9eSDN/WyCDSFOUnJPJ0v
         zcsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794127938; x=1794732738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNhQGc3GPqKfSByEN1B7roZuoogyK4AK7uxo1IzV568=;
        b=r0vAvjqVFYjLZAe452k28wa3tu3JYDnzu2GMHNBYXqtR7uzUDuCp7hUbyxtufZVube
         jwcwXEW7OK/U4RUV8uYYTWvucEEOThg3XowPocmdnSTq6ZDwLDMqa1SKKqMzl/yA1if4
         +uAFUvnfQjdTKG0imwqni2kaPUWTURIhbUrcnerTKU+j6UGsnVHwQwq+/KbBKXXcWEdn
         uJC9xHiepSMMmzhYNYU8hSEmdZBiBYd82bcSSls9dpEGSrxguGzk37A8kAxoJKR+ckV+
         1Zj+yWgPth5DkSXrKYxHCQsunPXRQYnHxOoYk0oLMge6yv/iK0PmM81qY7Op91YTcubD
         k63A==
X-Forwarded-Encrypted: i=1; AL+hErFvYuDnJiTUY7F6bhUTNuH4SNGzmm4kVzXiNuvxK4WuDSYT0+ik46NFCKy/nk8YLDxz7/p62XhaHmjnLYqiLg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+c6+pXmr7h+YBCa4RrOAea6hZUZysJMn2PBwKeFKtRRLpNXszH
	Es1ffJoabRG8Nbl8dzTLNYW01fi7B1uP2bOn0AoepZ6Gi7V/6XUOcNHV
X-Gm-Gg: AYBFou2hrWqeTVuIGPD8BypyMjz90Ja6Met4Z9nqES4JmtS2GBkCLaosVlxMzdp7fNm
	+32DRyVwLuU4lkC07KNcxRa1Zu2AqR8NyA1DLiVaskd0Feq/yncv4cDfRpLoyoXQFjrazKWy7cn
	j8N4nl7L6mCJtaw1yQvAFRUtxhsZ8ARL5J1sENwxKfjAP1t1Sns2pLUw3dS8MoDSxE6Yo0QAaJk
	ufXw7UM5B0fT4nprHOEnHjgppeRo7+vVm2mf32xIJsnJK1L9r2gmm9rP3Mu5S1mbLlBifhAA7aM
	5v016OsA/6QDYYvBCMskFlb6lOuk/aAqBdYB7kDRceK75cspL+nYA0iaIfrBXuXHCvHMUdVkpVA
	cFFR5Sf730E3JKYx/p2okbsGx9CQJ3aJ3v11kx6fgUakria+hPwKuS/Vew15Kw8cA95qXL2nOkD
	RTkmoTAOh7vIlKeu8sCmpchoxVHJGQe5rbFWfGlwUYFDAH5JzUctL+xNz75PkUSOG+Lei0CT3OD
	qAuszv6BA3NsPuCbvfRnkp/Swwf/6gLZ9QnIP2TLQaXItExdbOZV1Dx4n/2cz2k6zx/agZzS2RK
	JOlpbpuJE2E89oT7nTEjEZ8pqa6i3iQ0qCf9qTxqA8nbI59eQ4i2uX1Ag/bz
X-Received: by 2002:a05:693c:41db:10b0:351:4866:255c with SMTP id 5a478bee46e88-3725e82af56mr2079362eec.32.1794127938349;
        Sun, 08 Nov 2026 00:52:18 -0800 (PST)
Received: from xploitoverload ([2409:40c1:6412:e5b:5516:cd42:6c8f:c918])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d60absm4050694eec.26.2026.11.08.00.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 00:52:17 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com
Cc: luka.gejak@linux.dev,
	kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] wifi: rtw88: clear RTW_FLAG_RESTARTING in rtw_ops_stop()
Date: Sun,  8 Nov 2026 14:21:24 +0530
Message-ID: <20261108085126.331784-2-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108085126.331784-1-skalpesh942@gmail.com>
References: <20261108085126.331784-1-skalpesh942@gmail.com>
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
IEEE80211_RECONFIG_TYPE_RESTART. If firmware recovery was queued or
running during this transition, RTW_FLAG_RESTARTING remains set
permanently, preventing all subsequent firmware recoveries until the
driver is reloaded.

Clear RTW_FLAG_RESTARTING in rtw_ops_stop() so that the driver always
starts with a clean recovery state when the interface is brought back
up.

Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
Cc: stable@vger.kernel.org
Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
v3:
 - New patch in v3 addressing the pre-existing RTW_FLAG_RESTARTING gap.

 drivers/net/wireless/realtek/rtw88/mac80211.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 5e40cf06a9e..7c86da9e939 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -67,6 +67,7 @@ static void rtw_ops_stop(struct ieee80211_hw *hw, bool suspend)
 	struct rtw_dev *rtwdev = hw->priv;
 
 	mutex_lock(&rtwdev->mutex);
+	clear_bit(RTW_FLAG_RESTARTING, rtwdev->flags);
 	rtw_core_stop(rtwdev);
 	mutex_unlock(&rtwdev->mutex);
 }
-- 
2.53.0

