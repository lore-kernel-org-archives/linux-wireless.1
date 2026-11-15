Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794750007;
	b=0s+IU/HcGwVumM547Edn1Cg4BhUHoYYw7zE9XaBFICVUZrpX9ADmEcRAcJraLR8QqQEu
	 6ccA6uAo2YEKNt8bXYII5S6mHYmqYBnrDey6X1fzbj7fDTCTjyY7fJVuGov+FGuRUkcGt
	 p2psk7xjOGhuf5519hhAh6ddh2uafHiTefGvTlUlvfoqOCj9Jz0mTm5sGaFtODYdNSVYv
	 +/82fgvsYL2J3A5DWQtkvjus0O8UK5WXLmkBc3Ikj5i+/ymJ6V8JAY0Ew6fabVKIhbT5B
	 k4FDbBAGtBiQYZoGWAblj1K/ymmg8vXYfdjtZceQxzq6+3c8TSAuRZyyoGMWr7uJiCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750007;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=tyzB/wNMNyW5iEPRaltfrxfifBujmIUNbCHktd+CPYw=;
	b=XFNy5vW1UOJJxApipPGEWVzAGG81Ru9fXkww5ewy+wjB8O79soMc41yoCQEPGfeIovtS
	 U8oOl5c2JjUXGuq+IhEvRgXhVN8LXZaLUFAKavCN0+Z1Zt/lGvUQtg37CXmthZZOtC7lS
	 G64FqUYtAKZ93zU+yH3Ak+U6sxig8v7pYLtRQuMRSphqkDiIroAxhnCyKS+dAq00q9ps3
	 jBWm0dW8IFXVp9Di95UkHtDiJjB/JqF2Vv83449GRTuImNFKNe0CPOpt5ZWADoI7LoRw+
	 9vPK6NR/+os98iE64gi/DEbtoPeE/Lx8fNScFK+4OH1Ha6Ul+RUK5QwqN0CQME37bKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hxrLhF6r;
	arc=none smtp.remote-ip=91.218.175.74
Received: from mta0.migadu.com (out-74.mta0.migadu.com [91.218.175.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D5E606A31F
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 13:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7D5E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hxrLhF6r
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tyzB/wNMNyW5iEPRaltfrxfifBujmIUNbCHktd+CPYw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794750004; v=1; x=1795354804;
 b=hxrLhF6r2PGpyMrYcLEqBYteTP62osLHKWATHHY1+amDrE6LjDjeCll7RMQiVu/j7gshATJ9
 6boGMLrOwXcEj+4471oOPFQXY0BPyMZ6qO/jlUio95iVj3TCqvLsXbhK5/+0m6ae71Q4elaUsJT
 ajJCyccClJwKX8OL1cEY8rRw=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 574456b2b668cabb;
	Sun, 15 Nov 2026 13:40:04 +0000
X-Mizu-Trace-ID: 574456b2b668cabb
X-Migadu-Flow: FLOW_OUT
Date: Sun, 15 Nov 2026 14:39:59 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v4_3/7=5D_wifi=3A_rtw88=3A?=
 =?US-ASCII?Q?_correctly_expose_beamformee_capabilities?=
In-Reply-To: <1F34F485-2BCF-4285-9C7C-189DF4E5FED9@linux.dev>
References: <20261115114336.1739863-1-hjf3108@gmail.com> <20261115114336.1739863-4-hjf3108@gmail.com> <1F34F485-2BCF-4285-9C7C-189DF4E5FED9@linux.dev>
Message-ID: <8AC70D36-4A4D-40C8-82B7-A33EE345A729@linux.dev>
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

On November 15, 2026 2:37:46 PM GMT+01:00, Luka Gejak
<luka.gejak@linux.dev> wrote:
>Hi Jie Feng,
>
>Thanks for the patch. One comment on the description below.
>
>On November 15, 2026 12:43:29 PM GMT+01:00, Ho Jie Feng
><hjf3108@gmail.com>
>wrote:
>
>> Implement beamformee support for 88xxa since they have
>> support for it.
>
>Could you expand this a little to explain what was missing? As far as I
>can see, the chips had no config_bfee callback, and this adds the SU
>beamformee setup for RTL8812A, RTL8821A and RTL8814A.
>
>I think a short explanation of the sounding and CSI report setup would
>make the change easier to follow.
>
>Best regards,
>Luka Gejak
>

This is supposed to be for patch 4. I have used a wrong message id.
