Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985940;
	b=qmWO6YSHjn5O5jtc6snXudcF0iegcW/xX52mMalkYYJecNSqUmzEgp8sznTjpNbGo9Fd
	 nPKnObpYUq9L9u1pBcLpTyeg9y5wnAiLRNCpVzGgbaoPTOEZV4ae/q7w7lHDhsYlzx6rS
	 6gSe3EuuekQ/T96PiGsAXYURSapoT3wvCzdk7N3zM3daEDvppLTH1ODkFB6KcamK5rz20
	 9UceSoGoBF2/kJo8+S6C2hX6S0SASsV6OUUt9xgEsWQqEQXwNOn+/WDh+hQcB0uj/aA/j
	 RANFNvqd3KNf5Ad+z8maCEwwBm1rjCI4CRgxAqqwY/t52QTfWLHXAbKv7Xf9Fi9h9ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985940;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=H/UOg9os2Xl0arg8y4J05IPhLBvBmxhpvMTgvox6by0=;
	b=sEo94++lcS28fV/yj4vZe6oNdJEuyJ3xc0pnL8uezvt355c0ojP3+n/pluRQUQx15CfN
	 Rk36Fv3Gg+CNpxTXTnhzl4K/Mhgpfj0n63t5Q5eUBd0v+4ok653YYNyW2VR+elodoya8L
	 bF6htchHjP4XMjULophbe3tGUkDhA+0fu77Q5x/+4tj8yf4MVqGOFDBvFZX8sN9Bu54LJ
	 s8ssG8rjyMZ3Fmi69txeZqXShTAYhHNeGdV8NCzuO81Dma4eB7SDIeC3Pcj5pjabwWiQu
	 2SusJwFYO4LdEyB2dwIq/kxo+f5s5RIWEp3rRea6R5/x4ogvgwfO5u+TxxliaOPEFvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=se1TPWB5;
	arc=none smtp.remote-ip=95.215.58.212
Received: from mta1.migadu.com (out-212.mta1.migadu.com [95.215.58.212])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECE6606A32E
	for <linux-wireless@vger.kernel.org>; Fri,  6 Nov 2026 17:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ECE6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=se1TPWB5
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=H/UOg9os2Xl0arg8y4J05IPhLBvBmxhpvMTgvox6by0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793985937; v=1; x=1794590737;
 b=se1TPWB5A1/5xq4I21fUODT/aCpdXspCHpS3hMRPMJdyAnIipAsneUD4E5iEH5wsrKcRNjpP
 Qu5A4f8j2c4U2BwvaGmiTYNBPn9fbYfmaWXFs9TUczLwTUlNOIrbJvSEtIAeCleXC6FqegK/UBr
 7lfiJ4lWY+Q3QZV8GhtbD/ug=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8687d25d106980cd;
	Fri, 06 Nov 2026 17:25:37 +0000
X-Mizu-Trace-ID: 8687d25d106980cd
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 17:25:37 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <af3b96b7fa3d3ab02ef1ce53e3196e0cde53d624@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next v2 3/7] wifi: rtw88: correctly expose beamformee
 capabilities
To: "Ho Jie Feng" <hjf3108@gmail.com>, "Ping-Ke Shih" <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, "Jie Feng" <hjf3108@gmail.com>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261031070950.425176-4-hjf3108@gmail.com>
References: <20261031070950.425176-1-hjf3108@gmail.com>
 <20261031070950.425176-4-hjf3108@gmail.com>

Hi Jie Feng,

Thanks for the patch. As you can see below this patch is sent as
"Jie Feng" but signed off as "Ho Jie Feng", and checkpatch warns about
the mismatch, to respect DCO. The other six patches use Ho Jie Feng in
both places, so I think only the author name of this commit needs fixing.

> Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>

Best regards,
Luka Gejak
