Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215588;
	b=pH9AlEi5s3f8NKRC2ZODj4cHcSOq/PO1iq3XIcrW26/b+0raDFMWTHiGXH8KKu5u/GPy
	 vx6O/wODWxKl2z+LzcwCSGbjDlAYVW+CVGUt/8na7MP7lJKaPF+M5vGgCLlvE6Cspv7Xj
	 4v6jEk5lZqysZtNBQn452bY6NJh6x9xx1yi9e9NYp6jj8Ij1kZxAid3jU3SP9/BxHhqdn
	 WXJLhzHWQ8eMLgzhz7FFJc2EmeG2+LT79t3MV0NMxHhHU1vTzp+7/OIHfXbhi2zPVR6Wo
	 AnOReDdwgWcVLVdutO0MrbSoIpEAvrvX+ukjyqkBlfDVDiuwbQYY+k+VaNGNas6tSDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=SVSQbGh8zYpL/nm46MbvuON7rY9JKSGB3zTi9I6pqNg=;
	b=1QsU4uRU8AXQ6yIzhDKEQDpN3qIvyngEnHDZRtYr5a+k3+MMDQkjcV/qG/lLeIUs6zge
	 FSqsXW5ztYnT1zqVyRTMT3aJasL8owVXeyDH1x72BOu30/3QFLsmnQy8JUm7AZrhI5O0M
	 E6b5BVjn1AhdG5F8hVNnaFcfq/Ps1PpP3LrchjF1kqGaA7HWHjS60Sm/URIQqjjaAIwCL
	 XQegjUf8frjiig4bkh41t/+95SyRWsR4sPVz/4kSozwH9gfcQliYKOqVM2nn002vC68wb
	 ksjL77hSYXlyuZ4EM983VkOWN+74zWgLsHXU4gUxZHzZy4/tPtlebkFeQY+1vymif8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IDDwoLwM;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7348606A69E
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 22:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7348606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IDDwoLwM
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so13535825e9.2
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 14:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795215583; x=1795820383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SVSQbGh8zYpL/nm46MbvuON7rY9JKSGB3zTi9I6pqNg=;
        b=IDDwoLwM+AcdFg5sxUKH41H46H4Hrx2xTaUMauB/92+3oqndlAdNyVy9t5GwuvMglb
         b3HC/oIB0sejpbWCH4y7db7Gz3mZmcoxvVZ/j0/72IVl/h3eeSZxIFE206s9ISURrZ7j
         sFtSUsFNwkdUUe9I2k/efF9/7x/cAuzCkOGrgFutCYXSizqDerT7JVVcUKicCZJqplq9
         XTu/glDvJg2p9abIvQDL4MS5xkBd5GM7/N2OGARPNyk1V1rozu7ScFmSPfyXCkpGsIdu
         EEliXWfo4ZgGRALY0m/LovSoUTI1YQCXqyi/yPJgk0Y8YPsH0pfspyQT1XpWvH+5EmgR
         4RZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795215583; x=1795820383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SVSQbGh8zYpL/nm46MbvuON7rY9JKSGB3zTi9I6pqNg=;
        b=AXH9DU/hQooJ/yw19ywXXQBwYe4JUPu3DOSCrA1wtp8+01j2rQv9czXM99tl8/44vY
         m7I5We/QhAPY7YTe5bTgXZKsZmc5zQ1ZxrzkohiCX4HhJGrk0+S0CzEroMz596oVJvKb
         pRqfFMQHTHt5cyMGqirEgB4LPgG8HoP1sdMhGaX/FkiwUlsKWlxVtbBg4zt9On5mjVeD
         2v8NX+UT5ut6Xu5K5b8zHku9ue6tSVaUU42PSHrG0HpgP29uqzs6rKoPw2SxZ+6MW5DL
         K/eWCEO0rWjZgS4AgGzcDYGI1zJnRSL8KJTS2V5JX8WUsErmxcPhvEMdu1ZvaRZhYYd0
         Ea+Q==
X-Forwarded-Encrypted: i=1; AL+hErFg6VJ8kZSxRaWBaqynAGeiI5btRJBgUpuVLy6EcfxOlyAGp5HShktv8In1s6RtjEp9uEqJmMeayWC8KHU6Qg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/lgK9UqnGOREY1D7QavWA7ayAbd2xH+Bduy0TIFyCB28S6cZzD
	5dtJqw/zPtXeHSHrdYdPkvU/+EMXjWQAuQ4dcrLtVsLfNJkAR8fVFBg=
X-Gm-Gg: AYBFou3yf2J8ZcrzcdW5Q7q3bNpC6sEfgkdiVibxE8+6Sq0BNDAtF8cPg4cskMujOC9
	Jo+ksQ7eXd9U4maofAktd+jhfaPZgNlGPUezzV2md6Uvxh83DTmmFlz7U78GA4nWA+BeRMbZLZt
	4jNHCt1K0m+rv2Ab4W2WL0lrJWIhrQ8yMN+DJ28dTn1uuNzGP6CfvSwN0m9ET/7/UV1hi+F99eg
	+rq1Sg9WGDlirsGn5bgA0v5Md5NyAChl7jxvh7by/rHq7zXWV9+G4/H4BDwIXtri3z8PU7nSfqU
	EY98JoAIyd3kVA3XzjkyY0hWiEgTo4k5TNfnms03Icyy42OJMuhqtuaZ+WadGL+nDBqj6C8FroA
	1y8J+noGaFyEvIlof4Unfyu+3fD+H8uCBCB5M7LdspZDf1oZvs+wi+2rP/0866IXtabFCbektER
	9vAjstl6Hmr9i1MyxSvkftxOzGxHpisi/9eVPa9mmlhoyhWyOoInRDUJAKKnWEXfuHJw0YQa6BK
	+x5Wsj7IkzcX5P0OG/ItQRhcbrF+Dgs7fxmAV/o9kRgufyzHDwptscBhFdxhdseMtgvileXdWdC
	xgsu/hB/M2OHUcvVxVX05SP9vTKX
X-Received: by 2002:a05:600c:1548:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4bb88800013mr112919255e9.6.1795215583402;
        Fri, 20 Nov 2026 14:59:43 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm128863475e9.2.2026.11.20.14.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 14:59:43 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Jeff Chen <jeff.chen_1@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 wireless 2/2] wifi: nxpwifi: validate command response size against buffer length
Date: Fri, 20 Nov 2026 22:59:33 +0000
Message-ID: <20261120225933.1148680-3-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120225933.1148680-1-tristan@talencesecurity.com>
References: <20261120225933.1148680-1-tristan@talencesecurity.com>
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

nxpwifi_process_cmdresp() reads the firmware-provided resp->size field
and passes it to individual command handlers that use it to determine
how much data to process, but never validates it against the actual
response buffer length. A firmware response with an inflated size
field causes subsequent handlers to read past the buffer.

Add a check early in command response processing that validates the
declared response size fits within the response skb.

Fixes: 73b01e57ed3e ("wifi: nxp: add nxpwifi driver for IW61x")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v2:
- Move the response size check after timer_delete_sync() so the command
  timer is properly cancelled before the early return (Jeff Chen)

 drivers/net/wireless/nxp/nxpwifi/cmdevt.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/wireless/nxp/nxpwifi/cmdevt.c b/drivers/net/wireless/nxp/nxpwifi/cmdevt.c
index fc1950a125b65..ebcfee8cb3872 100644
--- a/drivers/net/wireless/nxp/nxpwifi/cmdevt.c
+++ b/drivers/net/wireless/nxp/nxpwifi/cmdevt.c
@@ -732,6 +732,20 @@ int nxpwifi_process_cmdresp(struct nxpwifi_adapter *adapter)
 	timer_delete_sync(&adapter->cmd_timer);
 	clear_bit(NXPWIFI_IS_CMD_TIMEDOUT, &adapter->work_flags);
 
+	if (le16_to_cpu(resp->size) > adapter->curr_cmd->resp_skb->len) {
+		nxpwifi_dbg(adapter, ERROR,
+			    "CMD_RESP: resp size %u exceeds buffer %u\n",
+			    le16_to_cpu(resp->size),
+			    adapter->curr_cmd->resp_skb->len);
+		if (adapter->curr_cmd->wait_q_enabled)
+			adapter->cmd_wait_q.status = -EINVAL;
+		nxpwifi_recycle_cmd_node(adapter, adapter->curr_cmd);
+		spin_lock_bh(&adapter->nxpwifi_cmd_lock);
+		adapter->curr_cmd = NULL;
+		spin_unlock_bh(&adapter->nxpwifi_cmd_lock);
+		return -EINVAL;
+	}
+
 	if (adapter->curr_cmd->cmd_flag & CMD_F_HOSTCMD) {
 		/* Copy original response back to response buffer */
 		struct nxpwifi_ds_misc_cmd *hostcmd;
-- 
2.47.3
