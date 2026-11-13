Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794541664;
	b=SJbbOdQ9LJ65jh/L56ULrWnwF5p3/78IILvzehKCLyhEATaVQsBuYrnULXZgcKqaJ1VB
	 uapZ/JWpzuJW+m0+Uv+duu2NIEZtPSTaKoN2ke8xDs0/E3PliwhlC5oWGm/l+VmhGsx6e
	 awiH4QoGGG0U/UU3QwKGl6RnpGcCFZ663M/TKvRSqLlrJ0obIBfniFN7ycYi+IIYjuio6
	 +RZzxPmPCevupjkox/dDyccHZu7griZa/uH9Ltod+RSsfygheimPp7YF9xeSHEaCGe5Sn
	 Ixq0gk3f1vpgqiolH+voQFHfJq7qnymiduf29TWRBoigPWvHsQLCAb0g0nrrGI9m3cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794541664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NmpdXM2MjAn3pA+0zNkVS3PYgcwnWLjo5ExDBOv3ygY=;
	b=4p9zgQg2Z/SxFTXqwsl+xDgbbW2hXpI1t2bhoseBEk6IkERKWvaJ3LuOUX7iUfE4lw6/
	 y0NS4tNNPahm+/uQS66d7Z7vb/lMfckdW8iKkNaJv9rICzKHgu7FyAgYsxGLH/xxqj9YJ
	 XfDkNPCnuuXcP+I0nBasDnk/b3YFzEtDc6T735ECaSX7nOz5Iq6DgrNfzLbyXmsUOavke
	 8gfVvptjiq+Zcqe9k+SoB+rEH3MuWwU1+4kMmbM6A/1ingZeht3VbA6DcLRHZw6ml9J9y
	 o0xhtG0yVfKsqRfTRMJkiocpoJ7INabb068U6TNoxxRXSQAKw0iSQEsIcLPXMbc2ejA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPcoBKsJ;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D31606A8AB
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 03:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27D31606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPcoBKsJ
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33fb4680717so1185001eec.1
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 19:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794541662; x=1795146462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NmpdXM2MjAn3pA+0zNkVS3PYgcwnWLjo5ExDBOv3ygY=;
        b=TPcoBKsJ8FB+hDdRP6EBpCYWmfC9D9OSUCsSYZucdFUMVJOk/Ul3perwrOkXzeub7E
         tJX7TcO6hQFOOqjYjEs/L4g6A/KUM+YVss7SGTfrPU80tWNwFYuCg4e8rZOPgpha/4YS
         +M+RFnFm794Z5PeceGI+0nJFrsXruy7WlXCnnOmZbciCEtKyIOGpy9zvRuJrqXSX2Go2
         oS5WdQQk9qv70WMK9A8r9tesw7HxeDg63K74T5xvZ5b6rzLuG5dJxotvcv4eMFmhrgu4
         H8l5e0y664EI9gc/p5JG2NNXM2BuGsyv8T/IRs3rMcqZRmQrEysOeyJoont0QqDK+qjI
         gzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794541662; x=1795146462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NmpdXM2MjAn3pA+0zNkVS3PYgcwnWLjo5ExDBOv3ygY=;
        b=kOhp6D4HAbjTGEgdQQk/o0D3SidMPf1WIe2qWLPZU7x+odhCz7KFkXoSVxhTA83aPp
         7C4o6u8Dcu7jYP//bphl120yKX2DYuTcR0Q6SIc9eYDEmp0BCHrNW79B9AYoNVhA0ShV
         gjR17XyRoni1eKih3NtBrNtx0HU6L9babMNdLGqRLubAT8CAdfj7+43q4gglzNWlubiM
         ngeEjV0AZx6G79DmH4TzHmxlg1qVT8Sx6B4E3GBXaVQyoj+vX/xtjSVkmj0wODLwgsUp
         /LoWjbzZOl4Yri5tSFle9PYPoa3GRKz8RtjTM6GXpfQERrRnnYMlnbfKj84kukTNvECu
         VDJA==
X-Forwarded-Encrypted: i=1; AL+hErG8tejZbmgW9rFLJyCcfiRUscrZEsX5o+XbqQP1WgRkOAHxR/FG5dyUBXvuZ+fbCcOKCL17cUg/tpra4GA+Hg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qeh2fQ+OZPiLYKPjXwAM8+8Z27zB3EdBURPeSlodtjZ1qo6e8
	VK3vcuR1vdAuQOr8JSSv+ITQ9WHvNKSzpd7w9M60atGjV05r8TQqHtMLux4lpLIu
X-Gm-Gg: AYBFou2nymDSg8Is8Do6DshY+ozBSNynPMcAZU14Kz1btCj6l4CnpHMMP04d8Q7WGXt
	uX091RCnoVFnu/pgedahrvmVxgpBLl/CYYEvI9q9VjE6dpJcuFHFwBjNFhPqJY26lcnUABBaICH
	Vkw7UJC+vTYulQ5lO4s/b+cQRVXxK+eN5UklIYvy4E6roFUjdbF4yzBdpNx45uOTddGkf4Sc8G4
	8ZTX1k+ysAMD83YA9P8XwmkSb67gzUT986l/Mz/7yqbLukIZTOWAlV5eZKGQ+Rp7MRNqXhSGXyC
	z1+CNORQYf6i1FT3Nvt0cYFje9GKF7HSq7ppoXae+RaNPktJVmBV/IOnH954Jvomlze7rGlSDq2
	UVFWxDXFkdQkKJyHE09p0cdTMxh2Clgfomkuu4e45jSjERf9UzaCpYCDdyrIb3K4SSo8RCEZD5s
	9PVmoxGprb9yMIVFXQgWRRlaOCFASW8Z48QjK1TbTtXs+6qWkvE83KNYCIzrSFaSoAS7VF+0DIi
	ZvFVxgDy4I4zLS3leFb7IuEfiLw6XnYfdnG1C3XRIPCCtVEGyXBPLe6loIBKgKG6sJXTcvw0l8b
	wMo9cGvfDve7NiINu+7h5a/eW39QTI7iqQLb2bIjXmw=
X-Received: by 2002:a05:7300:d718:b0:36a:12c1:3adb with SMTP id 5a478bee46e88-37966b52740mr1488706eec.20.1794541662029;
        Thu, 12 Nov 2026 19:47:42 -0800 (PST)
Received: from xploitoverload ([2a09:bac1:36a0:120::243:8a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm2882111eec.12.2026.11.12.19.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 19:47:41 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com,
	luka.gejak@linux.dev
Cc: kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: [PATCH v6 3/3] wifi: rtw88: ps: trigger firmware recovery only after consecutive LPS leave failures on PCI
Date: Fri, 13 Nov 2026 09:17:04 +0530
Message-ID: <20261113034704.21283-4-skalpesh942@gmail.com>
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

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/main.c | 2 ++
 drivers/net/wireless/realtek/rtw88/main.h | 1 +
 drivers/net/wireless/realtek/rtw88/ps.c   | 9 +++++++++
 drivers/net/wireless/realtek/rtw88/ps.h   | 1 +
 4 files changed, 13 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index 8e62d38a269..2a38a6828e3 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1537,6 +1537,8 @@ int rtw_core_start(struct rtw_dev *rtwdev)
 
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

