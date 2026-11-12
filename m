Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489287;
	b=V/dyqddqUeht6AAN9gsFGok0KtYSmfKxB/NMg9fhAspqGJL/WWfAxW8PqfDx2wvOkPBa
	 gacm8XZ3yCKIcBAm7z3fVQS9zvTtwDkSM4CVMmBaSsVDYttxpzXPRHkdElnwzIy5Qfyre
	 S8/9Kcx7Lp6XShYCQDIaAOEY9A/+H1SiUb/WNd2pTrPqNhjtsDB3PcRiQELQNauktbUNB
	 YSYAJsKmuxbE7Dv9iPNFzObN4u+9pDtJmdZFah10qacuZCrFolhklK+ine3+NWMaHsPN6
	 dI8zh1u1rS3YloDaBPFp8zh2JuDQmkqjVMpJsLVm3GNfoYf/pXHYROlSu+qYySFDdFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4DWrj9scuTY9FkX1CPBn7CvuhBuklco6ob8cgWlL50o=;
	b=DSwLdcaK3Z/hVJTKLgXp23q6vWfYI7+V2oOoshl46QCpcVbILGYbmo0DMq57kJTOZGtC
	 MhjxXrJV4IZarSQWZRxtscCGzEkkibpy6ycqRz37w4/jWn9+BbU9nP81tabJ5/BnDer0g
	 w2JwTbFcnmi4dST32wXHgDcW0hStjVHjIqrk9Sskm/ORyUBSTh4Bo++av9tfpOmceGO7k
	 azhsVJK7PXtXdQDP4erCD/LIsOI7sj763tCaZH0WBlptS1unOl0gYpfKY2q9/FageadvK
	 atjNtniKqUD1WgGMGbH40nNCJ09ALIBY9u8HFexZ7YxAZzNNuWxVuMrVNG3NpfoMTYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jc7xTBuZ;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E0D606A337
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 13:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01E0D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jc7xTBuZ
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1aefd1bf74aso673381c88.1
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 05:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794489286; x=1795094086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4DWrj9scuTY9FkX1CPBn7CvuhBuklco6ob8cgWlL50o=;
        b=jc7xTBuZbjhTUJHvTtDhFZKRxdPqvnFkI/VJrp0f+PS/R7XmDEYlECTimB20oR+GnH
         oMw01DI9rphJVXi/fT6j76kbbk1Nip6OI3A3cbD4sq3Vpjrx72ZO3eyd4F2QJZNnewqi
         0q/PHuPmPmNanfxnx+aDXm+Jw7ngcQGkr/VuS2OUertGwJvP0ifuSGvs7j46Vmrse+zj
         UItDQzlpIcvEtoXsL2GtmD8K5aUwmFEhyvqQfXJ+a56FmfukOnLtHJw1EzSHeRJKOEFi
         7pk4R0ceQlfR0d5bPhgxoxV1+JoExXZNL+67KnUaQKYyxUbM7LbEbYucU4UnhTqhCF11
         2tgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489286; x=1795094086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4DWrj9scuTY9FkX1CPBn7CvuhBuklco6ob8cgWlL50o=;
        b=deHBVE8+IJoWJuPhqWEP5CapD936ivftZ2sX1LINlyCkgV1SKD6tayT5HBzONJL+SK
         SW960VSlmlpbKkh0UHPrVjktP8ed52zaU3iTZaMSsci6Xb2nhWALNGe55efFdEVpXgiy
         7bNbI6lFZb+xq1LsIVTsacj3ZP7De8MP95lm5ujUdO09x+5QIjvgpHWvsXOZQxFYcKZ9
         lgfnybtqgN75jvxRVuhw0uGcfu/rKjn5j+sPGAm+GJYJ/N3RbpJFep1w5pQd2C9p3l6N
         ++0/xePpU7bxJ1YaKMezLBd/SBlcqm2cZarGMyTDUxWJJOuUML9IMz2rRc6rYOl1iFpe
         E9Pw==
X-Forwarded-Encrypted: i=1; AL+hErF5QcPRC0orXswJycYJgrdFRs4gbFGYZbJKRlBCZ9poSLdx3E0jGUZ4yA+06RoFjER22t4r5ZDAXPR9ZiT1vw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/QELVGvNp6kgIM3H/ze1ZgB6CA2m7E/FpsnUc+oTqA4RqOBmcx
	a+ZjmPVbhUZVyoxqimbliZXleBk6u1S96fRzq0Z3HaB5yLhhPF3Nazil
X-Gm-Gg: AYBFou0cZeXa6ncKVbVoKsRgEoOo5BaPJtePNOYJZOSUlkTWXyYfrKfwD7IB28i22we
	WW190Kfj33JrziM99czsjsxj0TPz7vEk/CU4yixNrlQLU4vePTM012+alka0lZnYL1/PjDIzT2B
	2RFA5LnKmRZbJDmvMEiUKCyOIuzHvOH2G7QKQyR1pCIfS85VduV527y+f3dTnPCYueEL2LXM893
	C4GSvVKTM+BDGwEoRD3z6JA1DMC4WvNsnJ8yr8Oe6nW4SSb5vMk4avmv+SdPudLTr2A2RWmCBWj
	Q37HQpYajAl1r7WQ9PuelC2EJdQK6kOT6xUWhjHJ3Ce3x1Yh9V+oD7zvuuCdnHTSToje0vvmz4m
	20dXBGBPQxOUTz6Ky+ls8f331m2uptqoVqN9vcMI4UgrUsoMOSl6Jp/dgHtgLlPAGFvmaDsRn7f
	ENW6ZcRzSsxWuwtU3ryQUSfQF9ebU/9bHQBz0mBEa0OKthBLtJCzSOoVamg/QQKDTHpMHG/nRWE
	m/nYmsEFa5O0aL79kRyRGB30zaafcRdSXmBxnOU3EvH2IcwrCfcYyByrMebWaFNWx1FEcZ8ciZ+
	bSWJKUS3+hu8A+euBcTDvA==
X-Received: by 2002:a05:701b:2219:b0:1b2:5ecf:9bd1 with SMTP id a92af1059eb24-1b4f5f1f0a8mr1962840c88.7.1794489285963;
        Thu, 12 Nov 2026 05:14:45 -0800 (PST)
Received: from xploitoverload ([2a09:bac1:36a0:120::1c5:160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b48a9c34c9sm8985969c88.4.2026.11.12.05.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:14:45 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com,
	luka.gejak@linux.dev
Cc: kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: [PATCH v5 3/3] wifi: rtw88: ps: trigger firmware recovery only after consecutive LPS leave failures on PCI
Date: Thu, 12 Nov 2026 18:44:01 +0530
Message-ID: <20261112131401.236433-4-skalpesh942@gmail.com>
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
always begin with a clean slate.

On chipsets without FW_FEATURE_LPS_C2H (such as RTL8822B and RTL8723D),
rtw_fw_leave_lps_check() falls back to polling REG_TCR for
BIT_PWRMGT_HWDATA_EN. On timeout, the driver forcefully clears this
bit so subsequent packets can be transmitted. Because stuck firmware
never re-asserts the bit, subsequent register checks immediately pass,
clearing ps_hang_cnt back to 0 and preventing the counter from ever
accumulating. Therefore, only count consecutive failures on devices
with FW_FEATURE_LPS_C2H, where C2H completion signaling reliably detects
consecutive timeouts.

Additionally, rtw_fw_recovery() clears keys via rtw_iterate_keys_atomic()
under a spinlock. On USB and SDIO, register writes in key clearing sleep
(via usb_control_msg() and sdio_claim_host()), which would trigger a
BUG: scheduling while atomic if executed. Because USB and SDIO do not
support firmware recovery, restrict firmware recovery invocation to
PCI devices via rtw_hci_type().

Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/main.c | 2 ++
 drivers/net/wireless/realtek/rtw88/main.h | 1 +
 drivers/net/wireless/realtek/rtw88/ps.c   | 9 +++++++++
 drivers/net/wireless/realtek/rtw88/ps.h   | 1 +
 4 files changed, 13 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index a74f199a93a..d6acf33c3c9 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1536,6 +1536,8 @@ int rtw_core_start(struct rtw_dev *rtwdev)
 
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
index add5a20b843..908d2ea3572 100644
--- a/drivers/net/wireless/realtek/rtw88/ps.c
+++ b/drivers/net/wireless/realtek/rtw88/ps.c
@@ -166,6 +166,15 @@ static void rtw_fw_leave_lps_check(struct rtw_dev *rtwdev)
 		rtw_write32_clr(rtwdev, REG_TCR, BIT_PWRMGT_HWDATA_EN);
 		rtw_warn(rtwdev, "firmware failed to leave lps state\n");
 		rtw_fw_dump_dbg_info(rtwdev);
+
+		if (rtw_fw_feature_check(fw, FW_FEATURE_LPS_C2H) &&
+		    rtw_hci_type(rtwdev) == RTW_HCI_TYPE_PCIE) {
+			rtwdev->ps_hang_cnt++;
+			if (rtwdev->ps_hang_cnt >= RTW_PS_HANG_MAX_CNT)
+				rtw_fw_recovery(rtwdev);
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

