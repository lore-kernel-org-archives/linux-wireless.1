Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082244;
	b=N9ZZsvB1roSbzKPekxRLbHFtZeF2AciA8dwMuLNCsMc7ZQIcr96T7ZjW9Apu4yyAeMx9
	 oppnHUyqVIn0k5iGCqsiSjTkC6P9b3lP91atrgFwn/bcmLJiIscTdZMJnz7cudG5HAOsu
	 FDtEr/5ga/am77bEXnWxz/rR56AVP3hV2h1N9fCDqWQIVxx1wueGJwMhIhaFvLTT7f726
	 P6kIrwI1L+c2AIfxEpWues0/zkirzMzfbb4GLuU5SsRujhn6DKoMxqTPLSMHT1TmDqaQP
	 vY7HFLHDN1QTttvfYOZebRoFSVWT2lERLpJoJx9kyZPhkP09tqT837Li4q92j6Koz3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2V+wGVkR/bmuUwxagpFjiS03nC66w3wqlw9sy1FL35g=;
	b=2t9EKnZL+GBl0OLa2b+vMfU6Ej10sFa/J2VA7b2kRE8MKvC4CxdNo8s0vheYI323w1te
	 eliCmi2EKws3RHYUaDiDQHjT6ygL3Kl9IEQWpUs7937lppJeh4SqvACGTa/YxidUAYksB
	 /pElxM1qDM+mPDHwsRqw04WRhjFOVfdn4Pj95qK6EK391LC8z8AlvHymz1PYWbozEWymg
	 8JyjJ257ZDZpuJarYCz3DWKvE1f157vzriwgpoASUjERJruunqZNqD4G8jD04vys/AdyE
	 oBvGMbWMY/x/0RnNRDnjKWH36QCe7znWekoevRSBh387F4ETkoSS9BJQuW2uUgxWoDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mOOvgliG;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C186606A33E
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 09:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C186606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mOOvgliG
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33fb4680717so4672437eec.1
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 01:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795082240; x=1795687040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2V+wGVkR/bmuUwxagpFjiS03nC66w3wqlw9sy1FL35g=;
        b=mOOvgliG/IXzKqHUJra+5P9TKS0iPzaUt8dyPM425Qo11zKK59R2lrMDP0jwsZnSui
         0evw30p1b8ZMLuxaEwjDJJSENgZ8DRtfnIHZ5kdovnZvzMvg7ePgWfikU0AHOW/eNJCQ
         RHYO6zkU0JLh/QMfGNZO9Qh3erPMNaq7oP9X1N7g3vnteWNmpYke4uB6XQY5jDmT8vYu
         Dt0DbnVWxxcWreHW1C1UcEJuQ8aUWcdJWY/PXgSLTNj2Qn7+mxqLMv21rEVLa8815prH
         76z/dy6w9Eegcz/W2AqOPLXJDtLpfASR9XsJ9D5aH8gle4US48OJX3R3jX4hlTG0WJku
         bjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082240; x=1795687040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2V+wGVkR/bmuUwxagpFjiS03nC66w3wqlw9sy1FL35g=;
        b=2AQKfekMk/YSUPurkxaUrm+tJjnqTwQdI6iuNQXoiUJ9FwkuEt74uG8esF+xEuHswj
         ZChD6fnoP/CJCAI8sLjuRYnhfn6OSn4qSj2edvpAjGqwgeUvj9zol5rqmssgc5WBzefI
         Ynjy9Og0ly65f3HVWrI767LNZp5kttEJJBMbyXM0QBn3DYnGP2UDeiYzVKAo+dhy85gr
         fPCvNtV5UoonrLlgHCxEG7QHwoSUY2mcRmhmQNp0ELoTDqJdKTbhvqKkBEecoBW2qpxF
         cF45mqtVqEWT9EGUuyrwwckq0xj6d9cG4Rhnex3s81rERu4etn6R5NINAQ9qWkqxQi8l
         bLlw==
X-Forwarded-Encrypted: i=1; AL+hErE4+2TnTstFqE7vE5k6gT0tCyoEFgf7w09rmAlJ6+KSSDggrpYy0N7ZLxdQtvDhNZ3DjsXkRSy4nhBdJ6+h/w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/GQ2upUebiUUpCtv+/01f/pfadlkD0E+9CpPRdMgl2ccfttbUc
	cGgQZc1Z7xhHOa8rRaOPQJ/ReSL7Ihk55+At16Vclhsth6qmTBxpYPOc
X-Gm-Gg: AZFdTZdl40AHcVQrAVJgmXABwqPtpa48ofqi6G3Kc6mKRof/QfCWikkoxzo/VpkfEj4
	R8/lHj2VrJxzlpw1PcG39DEc3XsOiB+3DjcR8fWsJqayXwtAzHI2tgHqrzmVxpGTqk3OSzEtPqw
	CnE094TNTX/Op18KBOQGkEgMXa6wFsrFzSh+9ZO7HYyB1m7pxfQ420zU4g01gHJGEsgAQOKAXAA
	bxFz9HLNF3FHtQA81vrBqLPAFU6zTttQaDsZMiF747zgKisbwjpBeVafLBi5bekqMijtoks2Ibs
	wYQ0x4eVYZ3urfptP56tEx+BP8QE1pxJinGpTvIPvKOg63N1RMT9JBh9umVG72BAUlGfqQv8zp+
	rTKXjY24w37JuLUBM4yBCbk4uvTdaTv/pPSJ5Ubf25OSMhkj0RfOwKU/jllnsvU1WYMRBRBt9vO
	3+rThnDpITvOYhIJpENTd3p3f6Xp3+GyVdp00IzAbJBzahnD9gWVEz8kRJVnidlluypq92a1tIE
	zavf7L3i9qLeqpMGwCs4TQ3Od4f99+oaPT8aSGda9jXBOp+99rIIJHVQpjc3b+8OLLX4P1HHV5j
	5sMeW9BAFDYSkvnjXVp6hZUKjNFAVXRk8+PBKx2VhIwbVCX5OCbEKIykVflmzLTbizv2sGRx2EM
	=
X-Received: by 2002:a05:693c:415c:20b0:384:4451:f6d with SMTP id 5a478bee46e88-38444511167mr1764888eec.11.1795082239992;
        Thu, 19 Nov 2026 01:57:19 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm24172665eec.5.2026.11.19.01.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:57:19 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH ath-current] wifi: ath6kl: avoid A-MSDU subframe overread in aggr_slice_amsdu()
Date: Thu, 19 Nov 2026 17:57:14 +0800
Message-Id: <20261119095714.991770-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
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

For each subframe from the device, aggr_slice_amsdu() checks the
payload length only against the range 46 to 1508, not against
amsdu_len, the bytes left. A subframe longer than the bytes left makes
memcpy() read past the received data. The u16 amsdu_len also wraps
when the frame ends inside the padding of a subframe or is shorter
than an Ethernet header. The loop then reads past the frame.

Check each subframe and its padding against the bytes left. Treat a
frame shorter than an Ethernet header as empty.

Found with a CodeQL-based static analysis tool that we are developing.
Reproduced in a userspace harness under AddressSanitizer, which reports
nothing in aggr_slice_amsdu() with this patch. Not tested on hardware,
only compile-tested with W=1 on next-20261116.

Fixes: bdcd81707973 ("Add ath6kl cleaned up driver")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
I used an LLM to help write the harness and this patch.

 drivers/net/wireless/ath/ath6kl/txrx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath6kl/txrx.c b/drivers/net/wireless/ath/ath6kl/txrx.c
index 609d458ca6c5730..7ae14d470627276 100644
--- a/drivers/net/wireless/ath/ath6kl/txrx.c
+++ b/drivers/net/wireless/ath/ath6kl/txrx.c
@@ -997,14 +997,15 @@ static void aggr_slice_amsdu(struct aggr_info *p_aggr,
 
 	mac_hdr_len = sizeof(struct ethhdr);
 	framep = skb->data + mac_hdr_len;
-	amsdu_len = skb->len - mac_hdr_len;
+	amsdu_len = skb->len > mac_hdr_len ? skb->len - mac_hdr_len : 0;
 
 	while (amsdu_len > mac_hdr_len) {
 		hdr = (struct ethhdr *) framep;
 		payload_8023_len = be16_to_cpu(hdr->h_proto);
 
 		if (payload_8023_len < MIN_MSDU_SUBFRAME_PAYLOAD_LEN ||
-		    payload_8023_len > MAX_MSDU_SUBFRAME_PAYLOAD_LEN) {
+		    payload_8023_len > MAX_MSDU_SUBFRAME_PAYLOAD_LEN ||
+		    payload_8023_len + mac_hdr_len > amsdu_len) {
 			ath6kl_err("802.3 AMSDU frame bound check failed. len %d\n",
 				   payload_8023_len);
 			break;
@@ -1035,6 +1036,8 @@ static void aggr_slice_amsdu(struct aggr_info *p_aggr,
 		 * Round to nearest word.
 		 */
 		frame_8023_len = ALIGN(frame_8023_len, 4);
+		if (frame_8023_len > amsdu_len)
+			break;
 
 		framep += frame_8023_len;
 		amsdu_len -= frame_8023_len;

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.34.1

