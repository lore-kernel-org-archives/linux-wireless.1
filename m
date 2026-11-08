Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794127944;
	b=jbo06rlKo9Mr6/0kQWP3tZclw9LczdLNH/blT5nowehdNJzMZKNGOLTkeWZoCO8qAcGJ
	 96Hesq2RPkkVKgGSr2DKiAkhBdF9HO8eh0FzvhRVwbTAwMtMhUf+9sqBpMzCidmDxav5S
	 taSSauPXJ+VmA+EjVtPKaPMJ6kHynMUZnl6FrVyLRiigCZ1D63XADq8LzPn0NSOwLvuD6
	 mtVptG4x9FkhQ5RuYDEs30nPKC2BYuoiuO54UxJxypPDfFvIy+Rec/9iWugQhZzpRLQbX
	 NDHVohQK4XPCtRM9nCSxdAgwbfDeny/EoVoWUaWHfNCJG4NYkDhaymHRAUKiBBfXNrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794127944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KVLGihen4u+t7vomj3QVWKFhl0WAyrldSCIuQh4Fluo=;
	b=2dqsIlNtsRGcV8oYuiIdcqS+TWPVCJaeRwXycAW6u+sQhTMhTtZxUDf551hC/kRVtnXl
	 IIsomAfaZ0gMuTEvBB6DRv7Jl1re1e8vLBd6lg4rTo5Pu4JSiXNFr59knJefY6Pdl2jUG
	 zybbLXB8jQGa3XMymJfcmxggV78fOHm7wgBaKe16V3oPL1VnrijK+bO6uXpwKMmL0tPMH
	 bhle6k+NWKj4iDGpHKqsz+jLsi+zjER2AeYVF1+kzrob5VaZIeAZCXZCMMMEmUgIbH2vl
	 d71wsVheRtSdMXFhWquAoQoYRFqgL9iCbSAiaKS2K4vjC7Ori9iEW5+lty+6ewMI6YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vh6Nupwx;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BC2606A31C
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 08:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50BC2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vh6Nupwx
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so751533eec.0
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 00:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794127943; x=1794732743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVLGihen4u+t7vomj3QVWKFhl0WAyrldSCIuQh4Fluo=;
        b=Vh6NupwxhBlFRBX7v/K63YbgKPiuUfr9LjtsCUWB3WXNNkfRqgYaO3SlXGFl/xArng
         MQ+else5u6dOlK7rh9SY8CXwSa5CE452/wSihdDOqDeUxs5ZRLjNlVY7TVwVtjMKKsJ0
         0JYuINX5E36Cvx4UZ3pTv7KYhvQ3m6rQXkqPINM/VHRENt/km0PuG7HW4XfVxxoegJAG
         6sg4MXsr2ryEWNcE5ZxcOmjgYgKY+JNNMmoQLt99a+vqu3qW9h8ozrPDWDP9moV1sXpW
         /yaq51u+ke/rGmr03CDCLQXMgUxrxZC7E6OKlWLvFM3s7K1xKACdwGGPZBZjM+Hhh61b
         V56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794127943; x=1794732743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KVLGihen4u+t7vomj3QVWKFhl0WAyrldSCIuQh4Fluo=;
        b=deuxFVWcpp3UVs87NcHrrESrtkbwdDpA9bZQacjwO5Y6aywwixsOperEX70bm3ho6O
         d+RnWp21hOVX+EHymiXNfKyvQWyyWIBqMBVL3stLk2pRt0bGrMLWIcTErLNfiSATjYde
         oiSyDuoyt7aVaA+84LfROdKnDe7jhmzmhtumu/jJQJUU8TBtEmHiBrfJAepJcdqYX0LX
         nI85DaetKXJw/Q2pc190mqNGKqZfzwCic60qvtmoHLzdKAcmF/SakAowmbMYsiJig4OK
         hmMZZtuEuLqndlRIq7aS4Xh/6YcgnNCRKYZn9Qt9kNRkntPV419QonjO8siivF1L80fb
         wq6w==
X-Forwarded-Encrypted: i=1; AL+hErFJWBrd/tlIkvmxJ/bYiXtRjrz1JfdhYIgcLk9BnhX73x1zvpBQZMX8b3iKJNhX+pXohm2Aa1ZEJS008COU/w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8duAXBWO4nm3yqMrvQSn3xyYka9C9tHysNRtZNyGWSTAOAgFBq
	NbTen/G+p4Cjs7Kx9yE/h5JZjsE9LjGSV4CzeLyRkYAFeaIgcZu/Sf4E
X-Gm-Gg: AYBFou1vPzFchmIC3sHXP4sO2q42UWcZo5Vn/kZGCddKRVSa+Q2wczZSZEaKSEHwBLL
	72gxkQmvfBU4rsJ8tCwyr8sgQunupARTPdIi8qgMzZXKebFLVWAXo9KJ44zUlCJ6oPpGOhMRm+I
	IqYpUd0ZF0fO61h3QaBcGaqbq2IWkkFVEV/TLHAbNHM8XRb+oiHIIvgyRn8Dp1ta13V9L1UoknY
	+zixSGZ3xbvHaWmM8KeG63aPel4mL7dxRMqKq1WrGmXoucxNpuF6Tav09xqcsuJhVys1e9sjgT9
	BhyzLcVWgwRRDJxR/XEOmGsTWKv7XmB5ohxo+G5aTH0g5gd+CGlg0gUBotZ2d+FExABOV2NMmXv
	fzP1KmmKUVDoIHRNyWjAzTltC2Cln7BXuDDHWG/GtuxXSUaC4YRYi6CKyU9B+uEwQq+48qAe6EG
	Tk4Cx4jEJd+TdK5K5w5gPR6w5RRAHjFNh1eY8bMR55hi3IGtzb08m0Z/KRVwQkqHkB/UtBIYjxq
	+eaCq8MXNto5QuANQTofXC6G0wpqdU4CbJd+WWSQ29S8xAFhmC5yNqtWYEQv0vd0gpUqO6KFKoN
	qWROYMrot+wtAuc9qP5f3PKSvsjw0m2jajPmxTg=
X-Received: by 2002:a05:7300:2153:b0:371:ede8:3e9b with SMTP id 5a478bee46e88-3725ef0f5bbmr3340040eec.36.1794127943507;
        Sun, 08 Nov 2026 00:52:23 -0800 (PST)
Received: from xploitoverload ([2409:40c1:6412:e5b:5516:cd42:6c8f:c918])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d60absm4050694eec.26.2026.11.08.00.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 00:52:22 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com
Cc: luka.gejak@linux.dev,
	kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: [PATCH v3 2/2] wifi: rtw88: ps: trigger firmware recovery only after consecutive LPS leave failures
Date: Sun,  8 Nov 2026 14:21:25 +0530
Message-ID: <20261108085126.331784-3-skalpesh942@gmail.com>
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

A single timeout in rtw_fw_leave_lps_check() does not always indicate a
frozen firmware; in noisy RF environments or during beacon loss, the
802.11 null data frame ACK can be delayed or dropped. Immediately
triggering firmware recovery and a full hardware restart on a single
timeout causes unnecessary disconnections and kernel warning traces on
idle links.

Follow rtw89 by introducing a consecutive failure counter (ps_hang_cnt)
and only triggering rtw_fw_recovery() after RTW_PS_HANG_MAX_CNT (3)
consecutive failures. Reset the counter to 0 on every successful LPS
leave and in rtw_core_start() so that cold starts and hardware restarts
always begin with a clean slate. Suppress raw register dumps on
transient failures to prevent log flooding.

Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
v3:
 - Replace previous single-timeout recovery with consecutive failure counter
   (RTW_PS_HANG_MAX_CNT = 3), mirroring rtw89.
 - Reset ps_hang_cnt on successful LPS leave and in rtw_core_start().
 - Suppress debug dump on transient failures to prevent log spam.
v2:
 - Rebase onto rtw-next.

 drivers/net/wireless/realtek/rtw88/main.c | 2 ++
 drivers/net/wireless/realtek/rtw88/main.h | 1 +
 drivers/net/wireless/realtek/rtw88/ps.c   | 9 ++++++++-
 drivers/net/wireless/realtek/rtw88/ps.h   | 1 +
 4 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index f7708ad17b6..0aabd4e273e 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1531,6 +1531,8 @@ int rtw_core_start(struct rtw_dev *rtwdev)
 
 	set_bit(RTW_FLAG_RUNNING, rtwdev->flags);
 
+	rtwdev->ps_hang_cnt = 0;
+
 	return 0;
 }
 
diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index 6ecbeb4ffe4..525f17590ad 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -2113,6 +2113,7 @@ struct rtw_dev {
 	/* lps power state & handler work */
 	struct rtw_lps_conf lps_conf;
 	bool ps_enabled;
+	u8 ps_hang_cnt;
 	bool beacon_loss;
 	struct completion lps_leave_check;
 
diff --git a/drivers/net/wireless/realtek/rtw88/ps.c b/drivers/net/wireless/realtek/rtw88/ps.c
index add5a20b843..864e2be243e 100644
--- a/drivers/net/wireless/realtek/rtw88/ps.c
+++ b/drivers/net/wireless/realtek/rtw88/ps.c
@@ -165,7 +165,14 @@ static void rtw_fw_leave_lps_check(struct rtw_dev *rtwdev)
 	if (ret) {
 		rtw_write32_clr(rtwdev, REG_TCR, BIT_PWRMGT_HWDATA_EN);
 		rtw_warn(rtwdev, "firmware failed to leave lps state\n");
-		rtw_fw_dump_dbg_info(rtwdev);
+
+		rtwdev->ps_hang_cnt++;
+		if (rtwdev->ps_hang_cnt >= RTW_PS_HANG_MAX_CNT) {
+			rtw_fw_dump_dbg_info(rtwdev);
+			rtw_fw_recovery(rtwdev);
+		}
+	} else {
+		rtwdev->ps_hang_cnt = 0;
 	}
 }
 
diff --git a/drivers/net/wireless/realtek/rtw88/ps.h b/drivers/net/wireless/realtek/rtw88/ps.h
index 5ae83d2526c..b088fad7cd8 100644
--- a/drivers/net/wireless/realtek/rtw88/ps.h
+++ b/drivers/net/wireless/realtek/rtw88/ps.h
@@ -14,6 +14,7 @@
 
 #define LEAVE_LPS_TRY_CNT	5
 #define LEAVE_LPS_TIMEOUT	msecs_to_jiffies(100)
+#define RTW_PS_HANG_MAX_CNT	3
 
 int rtw_enter_ips(struct rtw_dev *rtwdev);
 int rtw_leave_ips(struct rtw_dev *rtwdev);
-- 
2.53.0

