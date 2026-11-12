Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794519050;
	b=X2aJNSCubECI4FTURPupiG10rtm6lFtXbSVhm3Vwfj825e/Ihx8yZ2QllJNwAmC304II
	 9MjWdhrU39AUd/56yC4ccFeV8QRuuJ9SPfY94aTlMNCap0Mqjg7/OXCVmHhFUkxtWwpQR
	 zyscz342VfJ6gsJByQGgP2YYJrNTTTGEtkQeHh3MjwXkwzSkz51i09aKPLAwd+SLLTWIq
	 WX8AMNoATd0anW+TbD7mFJ8tA6BNBqDasmfRXAqBadw0hCaqdeKDWLxVgapVbC3R/SEqk
	 YitqlDpGFK5IoFeLUckuNgMspLNBcb8u/rSNg279360M/CffF2tuxudalWmQoyjlbxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794519050;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=enbHQOG53njxurxtSswat02xq05TDSeGAWKK/in+bcE=;
	b=TTaJuV655E3Myp9f2P1Il8TTzmvlbWqDkHzinS/+pig3kLUcpILCBqf8fe3z8b1acGkt
	 JFw7BGLerX9iEJbndFYnC0t89ZSd7inChRdBqFg2A/rZGEWonOkWKsm8rBXWQAqrzCoNS
	 Hkv2sbkMjMa4IaobomvZeSmwxsnM0GvZ60zrYjQQQl3pVloSwPEjDN458dXq18rbsRmpW
	 6jeufLuxQWy5bWHZdwXe5ZDIwxW0e5JiVcTePU2doNvaL1lUmCkMJ/qvXQsiC7dHFZFnI
	 08/V/vFS3v0ceTUCaDLkgAjGia6FUeBtR6/aQ1NCyw93T4GYTLTe5Bjx4znPICo6FtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=M6RpMNTZ;
	arc=none smtp.remote-ip=95.215.58.95
Received: from mta1.migadu.com (out-95.mta1.migadu.com [95.215.58.95])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF15606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 21:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACF15606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=M6RpMNTZ
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=enbHQOG53njxurxtSswat02xq05TDSeGAWKK/in+bcE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794519047; v=1; x=1795123847;
 b=M6RpMNTZwtQ18QvoqkblJhwdwZWb03BGx55lusG7kDZSNdgG5a1rkpUA4gQVRZ28pAk2RFB6
 pi+BJ9tqp4qduwp9e5K0NBl0zH9JIKCRV4j8NTRkOSTpYEOojdM5Ym+xPFP4UikyfvZJFLvNZqf
 dp1LAyI0UAkmrkfGGti+uR0k=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 12e4800f869ef18d;
	Thu, 12 Nov 2026 21:30:31 +0000
X-Mizu-Trace-ID: 12e4800f869ef18d
X-Migadu-Flow: FLOW_OUT
Date: Thu, 12 Nov 2026 22:30:25 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Kalpesh Solanki <skalpesh942@gmail.com>, pkshih@realtek.com
CC: kvalo@kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_3/3=5D_wifi=3A_rt?=
 =?US-ASCII?Q?w88=3A_ps=3A_trigger_firmware_re?=
 =?US-ASCII?Q?covery_only_after_consecutive_LPS_leave_failures_on_PCI?=
In-Reply-To: <20261112131401.236433-4-skalpesh942@gmail.com>
References: <20261112131401.236433-1-skalpesh942@gmail.com> <20261112131401.236433-4-skalpesh942@gmail.com>
Message-ID: <5AD46498-09E2-4700-B5DB-FE45142A3212@linux.dev>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On November 12, 2026 2:14:01 PM GMT+01:00, Kalpesh Solanki
<skalpesh942@gmail.com> wrote:
>A single timeout in rtw_fw_leave_lps_check() does not always indicate a
>frozen firmware; in noisy RF environments or during beacon loss, the
>802.11 null data frame ACK can be delayed or dropped. Immediately
>triggering firmware recovery and a full hardware restart on a single
>timeout causes unnecessary disconnections and kernel warning traces on
>idle links.
>
>Follow rtw89 by introducing a consecutive failure counter (ps_hang_cnt)
>and only triggering rtw_fw_recovery() after RTW_PS_HANG_MAX_CNT (3)
>consecutive failures. Reset the counter to 0 on every successful LPS
>leave and in rtw_core_start() so that cold starts and hardware restarts
>always begin with a clean slate.
>
>On chipsets without FW_FEATURE_LPS_C2H (such as RTL8822B and RTL8723D),
>rtw_fw_leave_lps_check() falls back to polling REG_TCR for
>BIT_PWRMGT_HWDATA_EN. On timeout, the driver forcefully clears this
>bit so subsequent packets can be transmitted. Because stuck firmware
>never re-asserts the bit, subsequent register checks immediately pass,
>clearing ps_hang_cnt back to 0 and preventing the counter from ever
>accumulating. Therefore, only count consecutive failures on devices
>with FW_FEATURE_LPS_C2H, where C2H completion signaling reliably detects
>consecutive timeouts.
>
>Additionally, rtw_fw_recovery() clears keys via rtw_iterate_keys_atomic()
>under a spinlock. On USB and SDIO, register writes in key clearing sleep
>(via usb_control_msg() and sdio_claim_host()), which would trigger a
>BUG: scheduling while atomic if executed. Because USB and SDIO do not
>support firmware recovery, restrict firmware recovery invocation to
>PCI devices via rtw_hci_type().
>
>Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
>---

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
