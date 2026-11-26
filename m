Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709650;
	b=NrG9DPywc37qMW4PcULNQmWh8Ue9XDt9v1yeb+wElrbb7Ofa4O2wV4Gliev5l1S0suEc
	 AqDtGr6bQwkx8BwYUFvfYF2/49r0hzus+KFinxfW+MDAqHzA+CqrXFy0FsEQkU+DXgjxA
	 rIbYxtwnX+ymrqpNihyFJB9GaE3cdSP1NKiMCr7lNKZhwpLjawADu0u2Lr9mDgnO5oNSI
	 MYIyfvnYQDfa3eXZv44+7d2TBpL3y5FuG27jo9Hlbrwp7LZ//iIx42J32JKK5PNYfvWCD
	 klOW+3OnEnapg2lSgNmv1kAJdAUend9J2fW00YV9zB2HiJsww9fn8ec1OyO9LXb4pcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709650;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=GERjiabOlmCFBKc3NSWCENplf+18eorcnI3QtjxvqhU=;
	b=sdDfQasWKiiIDWZaWpb16GvSOu1TIc4CVAkJfqXGtEQfCl6Kzt+lKAuLXd4SVWfJSQpJ
	 Jy3k/d16NTVycoy30LeYPS4MItfsWy8R5YKWKhv9cMTeEQVi00Hrf3FNl4UWVtXUX/xer
	 rsvFK8Nu3SyXpn0VDIc8rgkDGXeiZK/XJuiJnQd+kQnBzlpzT+i9htpLAhMPzl7BVCm0A
	 NcVPxk2Dp10etJroGKM6LD7dVLpJdR5N7xt9lzNW+saf0sM5kAj++O7/KY739D9waPtb0
	 UDkroNAJQjLFW4tPFwn1FKeERkyRU15s0orlTQqp5GxREM3BYZkoAbGM/paYufjiaEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=OarGgHzw;
	arc=none smtp.remote-ip=91.218.175.216
Received: from mta0.migadu.com (out-216.mta0.migadu.com [91.218.175.216])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F6F606A321
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 16:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21F6F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=OarGgHzw
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GERjiabOlmCFBKc3NSWCENplf+18eorcnI3QtjxvqhU=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795709646; v=1; x=1796314446;
 b=OarGgHzwo2faaDUhNApQVBRZ8RsmSfkcBhMnRKqR/rK/LyLP4bACTdTlI63mQOKmeF3gZJGi
 kVEFK14oG5QgHRgZcp8U6d/xGxnMWSliI4sTgU1N4fNQE5CFu1uotjL5oi5gpuXOYS5SCOJ0yp9
 y1iSomZRmPZYZL7hliJkqA27RlJta2ED0ygFAUbwsMsWvFnEp7cDrjowyPasLDv9c3zFbHg5cwn
 7tVfkgANge3lpWCziaQWI2q7BSaFqdgvQVa/BL1Ngqr9+Qikg7jM/rUMXo3wc33vZRNcKR1AL9D
 jdtWqZw15eAvp+u+S7vlxR2Tcyfsp9ceKAj0PZEYdD/cA==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 47d438154a0f9445;
	Thu, 26 Nov 2026 16:14:06 +0000
X-Mizu-Trace-ID: 47d438154a0f9445
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH mt76-next 10/20] wifi: mt76: usb: do not park the TX worker again under MT76_RESET
Date: Thu, 26 Nov 2026 09:13:53 -0700
Message-ID: <20261126161353.11422-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120174459.1657382-10-nbd@nbd.name>
References: <20261120174459.1657382-1-nbd@nbd.name> <20261120174459.1657382-10-nbd@nbd.name>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 20 Nov 2026 18:44:49 +0100, Felix Fietkau wrote:
> When the wait for pending TX in mt76u_stop_tx() times out, its cleanup
> parks the TX worker also where the caller parked it already.

On Oct 21 I sent a fix for the same double park:

https://lore.kernel.org/linux-wireless/20261021233935.748017-1-lucid_duck@justthetip.ca/

I withdrew it in favour of yours on Nov 21. If you re-cut the pull for
any reason, would you mind adding a Reported-by with a link to it?
Thank you.

Devin
