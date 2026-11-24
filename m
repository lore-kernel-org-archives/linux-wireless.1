Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541790;
	b=tffVSWwDxLtHQp2X4guOSMbFa0s2fhqrwnnoJLzJp1jsHssj6zDY83Jnp/F4k0TDbZ9S
	 jDPhvreiMknlotki6sMtO+gwvde99ZW6veNxADyW/BgLN7a9v4izULvo3qzRw14syuUB3
	 ynU9+mOiCcC+6nbm4eiv/I51KmCDfTwRxLmO4+CyjLcomTnHnQAtomcq16PwRiFTHDxo8
	 RrYA2YsXLHJN+a5IqWzpanh1lgaMYav8tmNIvkrM+AMVVfFMONTvWNc6Xz+hzqyrsG67f
	 bqTMGSH0246ricyiIz319O2pXPRQ11a95qXsXU8iAm+HA4KkgoMFaZvtLohYbYJ6Qnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T+gWk7jbAQldzIm4Te3qJfsfZ1r9nUHOK8HpT65IhWQ=;
	b=bmuu9oCB/+ftkbFd54vlygXxst09srY3s7tjgDt8JyNIYYOaHbDrJ8tTPn07RE/oiTXq
	 LgBUsLHaUC2XBDlH2MKY6T4qFPelxwxL848GaVHLIM3mozCMgdi3W0KkOIe7OnPWqQd3h
	 qbuDyDo2YcxrUM1/8KCOu5TrmdKCHUNnG33KeMoURjyLefLVXNVO3JKhWBnmFgoimLuQL
	 J1PtdiuTYljmvr3e3PpVa9HNKpQAVNsyaZ9c55DQkVbv/55HJX20sdGRIYF1tnePOyrVL
	 D3R6CStIwLAg4zkhpnznztT8/RY3f8xAuUAO3C6T2T6uM0PKSHpEwHI2Seczrx2CPBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FwixNfKg;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1B5606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 17:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F1B5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FwixNfKg
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so31309565e9.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 09:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795541788; x=1796146588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+gWk7jbAQldzIm4Te3qJfsfZ1r9nUHOK8HpT65IhWQ=;
        b=FwixNfKg27t0r5+SXYzmPZh0r9iJty6jafsBzMCflDZbbR5Okb9+QpIzeYuHZ7/COM
         4M8xfW8cJsj7Pn8coNecLw1fcY7V0sdGcU9hHsvDqMiicU+zaYxuWdl3s+azTY2J7u0j
         mCdGZz0idXyjnyhy6V7Sx3EFv9ElHGmvbBzGRSyvWUeJMxQtjuOyreWaknJ7aDt/X0q0
         G/p3WqBlNKyFRc6Xoeo8ZdaRTO7V4bOW19Ammb2HIxpBc+qInt0EAIGzgKHLv5T+oHdJ
         i25QsAbrqDOgRn7WR6tgpoZrGOq27J1EdpoACuFo8vLgPfE9jssHZqz4KxAiDEmuAwVj
         hXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541788; x=1796146588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+gWk7jbAQldzIm4Te3qJfsfZ1r9nUHOK8HpT65IhWQ=;
        b=RdJc6OeB5UjYzM01yT+w0ApAKXP7whO0KA6ODPZ574xstDLnJmxqh1wtdkhKm55Im3
         +Yy2ltqYIIdAVzDPHGjxbu/ML3y8b91V6PzokUGaSLkKdYAGG6TBxDOVS9A+UL8wtXMN
         03Ni/Ixdh8PxWR8QCD46VGA+Q1qJUckbmbti7x+OTxRGSx6hadc/d1pvPns04lYMZ/WG
         w7u8uycw3G83IKCseXbCfZF2P/ilpFuQ2e3S5nQro9vpFIRU3QURpN1kO5G7sRk6wtwi
         BMC8GOtWZjmUv+I8uidolmlDYKdIjeRTrOWwvIq4HxGXJj/Dy1y0cfgtSCW1tqFxHk/f
         toPQ==
X-Forwarded-Encrypted: i=1; AL+hErF6SNY4Q+os9f5WlRQ70BNGz1byjFXTTVhrWQ/VtkGH1TOYoCRGl3qSg6P1ap/vPea5m7fe3SdnuYTcBBVbgQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z//WUvkPYAxnxy6aODiAbjzYUzgDJyRTi46iJmMSrw70jVsm2g5
	6/Zd950JNK3ZNzzFQl2j0I5kS4lsfjKnPLcQCeR1gYaebRBdUe8Bcww=
X-Gm-Gg: AZFdTZfeLKsDnMIhfbjktnVzAYQAFgfW1hfxRYHUoLuBqB7TiIAzyHEtMqz+RSj9VP+
	4HRWfQoHxDPHva90hbOnCOmHIVjArJCjB3Uzgv+CA6R3XBwhO2TpPBrMcwmi2MZjW7dufAs2M4N
	yWvQNwtIHCcH87o3ssMwsvACrbjwUwa2rSLnBXjheQSZFxbQJQi69/V0FG62qJ4ShpB0pjevUuX
	SPqwDm6YcvnR2Ep5wJOcGa2e0yAy5+04mkGbNQKEmERsA7Nekl4OiMwIUMJp+TObZ/Y4tOiJ/er
	3T6aTwdvpdnTlRXsdfqN4nBBhEEaWWlOBQZKMgMq825YaAwBvpMjden/L80hijlaU3sy1JEUcgQ
	3CHP/p336EBMBkYb54o2IwQwvADxw3n3mdCKBHO+eP6ZBYUBXzTO/yc69Gf26HL4b2hCIlrvIak
	4F6/QbQeJsqp7FGT62rAy94B0nsz4Kgm+7lfSDHQUDVQZNBjQBEOvU4JeYauTZTQothg7ZCTO7q
	iJ0o5f8nXK1fzOWPLbdLhElqbNUjzsI5vqoknQ9xZEhGKpUiLLjg7Rm3DV4e9QYZvTCgJEmBSni
	Q53/XlxWCZffDsU=
X-Received: by 2002:a05:600c:1548:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4bb88800020mr340879635e9.7.1795541788246;
        Tue, 24 Nov 2026 09:36:28 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm267098675e9.1.2026.11.24.09.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:36:27 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Jeff Chen <jeff.chen_1@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Bing Zhao <bzhao@marvell.com>,
	Amitkumar Karwar <akarwar@marvell.com>,
	"John W . Linville" <linville@tuxdriver.com>,
	linux-wireless@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 wireless 2/2] wifi: mwifiex: validate command response size against buffer length
Date: Tue, 24 Nov 2026 17:36:17 +0000
Message-ID: <20261124173617.802875-3-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124173617.802875-1-tristmd@gmail.com>
References: <20261124173617.802875-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

mwifiex_process_cmdresp() reads the firmware-provided resp->size field
and passes it to individual command handlers that use it to determine
how much data to process, but never validates it against the actual
response buffer length. A firmware response with an inflated size
field causes subsequent handlers to read past the buffer.

Add a check in command response processing that validates the declared
response size fits within the response skb.

Fixes: 5e6e3a92b9a4 ("wireless: mwifiex: initial commit for Marvell mwifiex driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v2:
- Move the response size check after timer_delete_sync() so the command
  timer is properly cancelled before the early return (Jeff Chen)

 drivers/net/wireless/marvell/mwifiex/cmdevt.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/wireless/marvell/mwifiex/cmdevt.c b/drivers/net/wireless/marvell/mwifiex/cmdevt.c
index 6e04d7da62179..62f0e3152b055 100644
--- a/drivers/net/wireless/marvell/mwifiex/cmdevt.c
+++ b/drivers/net/wireless/marvell/mwifiex/cmdevt.c
@@ -831,6 +831,20 @@ int mwifiex_process_cmdresp(struct mwifiex_adapter *adapter)
 	timer_delete_sync(&adapter->cmd_timer);
 	clear_bit(MWIFIEX_IS_CMD_TIMEDOUT, &adapter->work_flags);
 
+	if (le16_to_cpu(resp->size) > adapter->curr_cmd->resp_skb->len) {
+		mwifiex_dbg(adapter, ERROR,
+			    "CMD_RESP: resp size %u exceeds buffer %u\n",
+			    le16_to_cpu(resp->size),
+			    adapter->curr_cmd->resp_skb->len);
+		if (adapter->curr_cmd->wait_q_enabled)
+			adapter->cmd_wait_q.status = -1;
+		mwifiex_recycle_cmd_node(adapter, adapter->curr_cmd);
+		spin_lock_bh(&adapter->mwifiex_cmd_lock);
+		adapter->curr_cmd = NULL;
+		spin_unlock_bh(&adapter->mwifiex_cmd_lock);
+		return -1;
+	}
+
 	if (adapter->curr_cmd->cmd_flag & CMD_F_HOSTCMD) {
 		/* Copy original response back to response buffer */
 		struct mwifiex_ds_misc_cmd *hostcmd;
-- 
2.47.3

