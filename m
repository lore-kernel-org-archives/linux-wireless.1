Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157787;
	b=PySn/2w2j0T/jts+5jhyWXcjhKWJ8udZXZKIKglhpp2YynQU8pPkFAjxGJlBJtzbRb6d
	 GFuNiIKpq2WJAP/r/HWcnfXfjCDNIk8Kop2+zSClJVCotiM3wPQ4gwiLP49iYZOjoRHK2
	 70EfDaEtv2Dsc98mzqmbV2DWyR2CmrTA+toIynpmgD6+RrZP0Uak49Aatrp5LjCQaRlZ8
	 l6zOHugbMJ6wxzy6xA1ZTl7st7EYqhQn3wETextSmtRv6Gmy9afWWf5elCb+QuzhCrts6
	 qDh8V55oMf/D0iX/9+51YvbbrdEOHhrCIih/xslWKSmX8XEEQOOFNY3cCa02SSuC2iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157787;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lEpTX4ZvztTFMfF/nCyYaQqSwpTcux/2CJlB1VtCA34=;
	b=peAgx2XXbjjHUO2lNl/pSrTwX2sHgp+a1f2TLvUJcNwfd4dbMVmh2wqOtposjbKDa/kq
	 YriENIriuM8LIqEz1gtTZZEt+AzNFkNUw9U1KjHc7np1Pu6qEuBhOTcGWsLFKNgwEZpPS
	 wKyNXBGBnmX5HiQmjMQ76fi8aj7ewX5lXaSWMf0+8AIbp4SaAXlDe9+BAjNS/5QWUuvNC
	 hbtTOGmTEVOfPA2s5+aesacvxTgByzY7txdVadkx+aYpocf3oJczlhBKTtmip6pxDr8A8
	 TcP8AzFHAmPep2xix/3r6Nnns71a/KV4HggQV8J06t9HklkU1314GCXc92ogclHfmCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ObBwAeaZ;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F57D606A320;
	Fri, 20 Nov 2026 06:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F57D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ObBwAeaZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ObBwAeaZjOCxqCvIYc6p0AGAbT4EAlHkkvGGOiimNzrZMpt5+GVQVEofkPJKmUZz5LUCZBlKv+MWV
	 QDd9VSbuW5qqu4SE378g1x1WH+DxEYlGccLEYCgZD9e5jv6ZwLGin+VB4Z1aNexc3UvqjbpLsxvrAi
	 +4FkG77R/MZAkro4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16affef169a0-01576;
	Fri, 20 Nov 2026 14:56:22 +0800 (CST)
X-RM-TRANSID:2ee16affef169a0-01576
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.112.32.189])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86affef156a0-821da;
	Fri, 20 Nov 2026 14:56:22 +0800 (CST)
X-RM-TRANSID:2ee86affef156a0-821da
From: guohongyu <guohongyu@cmss.chinamobile.com>
To: lachlan.hodges@morsemicro.com,
	dan.callaghan@morsemicro.com,
	arien.judge@morsemicro.com,
	johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	13057616121@163.com
Subject: [PATCH v2 1/2] wifi: mm81x: clamp command-response copy to the received skb length
Date: Fri, 20 Nov 2026 14:49:04 +0800
Message-ID: <20261120064905.192045-1-guohongyu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117032227.154874-1-guohongyu@cmss.chinamobile.com>
References: <20261117032227.154874-1-guohongyu@cmss.chinamobile.com>
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

mm81x_cmd_resp_process() copies a synchronous command response from
the received skb into the caller-provided buffer:

	length = min_t(int, length,
		       le16_to_cpu(src_resp->hdr.len) +
			       sizeof(struct host_cmd_header));
	memcpy(dest_resp, src_resp, length);

src_resp->hdr.len is the inner host_cmd_header length of the firmware
response.  The skb, however, was sized by the *outer* mm81x_skb_hdr.len
(mm81x_yaps_read_pkt(), yaps.c:186-199: skb_len = sizeof(*hdr) +
hdr->offset + le16_to_cpu(hdr->len); skb_trim(skb, skb_len)), and
nothing ties the inner header length to the outer one.  A buggy or
malicious firmware can therefore declare an inner hdr.len far larger
than the payload actually present, and the memcpy reads past the end of
the skb's data into adjacent heap memory, leaking it into the command
response buffer.

Clamp the copy to skb->len so we never read past the data actually
received.

Fixes: b1906cea00b0 ("wifi: mm81x: add mm81x Wi-Fi HaLow driver")
Signed-off-by: guohongyu <guohongyu@cmss.chinamobile.com>
---
Hi Lachlan,

You are right, it is not. Both fixes only clamp lengths declared by
the firmware, so they are hardening within the firmware trust
boundary rather than fixes with real user impact, and the driver
first landed in v7.3, so the only backport target would be 7.3.x
itself. I have dropped the tag from both patches. No code changes
otherwise.

Changes in v2:
- Drop the Cc: stable tag. No code change.

 drivers/net/wireless/morsemicro/mm81x/command.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/morsemicro/mm81x/command.c b/drivers/net/wireless/morsemicro/mm81x/command.c
index afb7ee9bb236..591e5ba10753 100644
--- a/drivers/net/wireless/morsemicro/mm81x/command.c
+++ b/drivers/net/wireless/morsemicro/mm81x/command.c
@@ -209,6 +209,7 @@ int mm81x_cmd_resp_process(struct mm81x *mors, struct sk_buff *skb)
 		length = min_t(int, length,
 			       le16_to_cpu(src_resp->hdr.len) +
 				       sizeof(struct host_cmd_header));
+		length = min_t(int, length, skb->len);
 		memcpy(dest_resp, src_resp, length);
 	} else {
 		ret = le32_to_cpu(src_resp->status);
-- 
2.43.0



