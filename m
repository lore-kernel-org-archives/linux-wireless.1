Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062397;
	b=mG/4OuvTj4YMPVqwZdmZzcxFbf3LwgQBT009OoGb7ICdwrDkIZ0SAknE2XGirZDPUOzS
	 vjNB38+7oopSbzjXqXIsPB74q9cg2p7wv1fA7oM4M6E9M07fjkjRV6RY83yrYVPlwfAeo
	 Pfkf7DHD+W2qUTS5Un5Bs5x6e3pDYOnE8be+SPB8sEkdAm5GcDe+Rf6i5yL+ROe/QaZzw
	 oaBRpiI1dc8hvVfZ/XrS191bhjKYgpxFTOy8FyOmKF5AoKlwSGuBcSOL82sDx5zS5K4Wh
	 /5AgNW2rnZVjyS7J6vsx3IRl5nCaS010Gwg1gmJe1W6A6ubhI6xp0E7ya+Ey3ZKPF4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062397;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=5o9OR9vCOWkeQWyrFZJU2J9tzLuFcs6IDbCOy/FMjlE=;
	b=XlbBtQbPHiutIM8cFRR9rYfEow0DWIZBsdQKT5nJ9+ICluQ08YrCgX5qsn56d3AIkOqf
	 7mdwUotLO/XJ/TK8ayPztR/2QVSlHwjNRUvMXu80K+XsSWS+9eEXWL4oIn9pVxUWdf+Nm
	 W8mFSTBEvNkbVuO0grT/L8Lveo7iOrPeWboqLrkNIJGEh7HyMrGW+kmGNJ5xD+xG1k3Yd
	 QUkPBlkWTyP+YkxjpD8BRi3HDqNSQXlu5JqhMKdurd2xwXy9w68d0lCqfD88WVGh9su0m
	 92sgBU/hsF0hbthPj0TdDZHNzSd5G35IlSPFcdcOm5j/GBQSzCkphGJih3FxJ8HfRlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=L37HXPtI;
	arc=none smtp.remote-ip=91.218.175.31
Received: from mta0.migadu.com (out-31.mta0.migadu.com [91.218.175.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF14608361C
	for <linux-wireless@vger.kernel.org>; Sat,  7 Nov 2026 14:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BF14608361C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=L37HXPtI
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5o9OR9vCOWkeQWyrFZJU2J9tzLuFcs6IDbCOy/FMjlE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794062392; v=1; x=1794667192;
 b=L37HXPtIiQeaOd7BDvTb4NDCfJR2TKHuELskCH1zdkt70mPWtVFOFQ3in1wBOjL8WB0brus6
 3Fr6jKx5ufTtNZs4JoKlBtFTQQaZhyi8ZrumOfyOq1IFiGPkjM7ZyCseHGNHY3gsZrq94emkdni
 SHv9Xl6dTbEh37YUXN2ympoQ=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 249577e5de7941ac;
	Sat, 07 Nov 2026 14:39:52 +0000
X-Mizu-Trace-ID: 249577e5de7941ac
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
Date: Sat, 07 Nov 2026 14:39:52 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <04acc13ca12b3b4c31f7e89c878b727741250258@linux.dev>
TLS-Required: No
Subject: Re: [PATCH rtw-next] wifi: rtw88: 8822c: fix out-of-bounds access in
 cck_pd_set
To: "Zeshan Ahmed Nobin" <zeshanahmednobin@gmail.com>
Cc: linux-wireless@vger.kernel.org, "Ping-Ke Shih" <pkshih@realtek.com>
In-Reply-To: <20261107124255.41144-1-zeshanahmednobin@gmail.com>
References: <20261105113415.73184-1-zeshanahmednobin@gmail.com>
 <f6a7d3272fe7635c6a83698dfab5d85500437ca6@linux.dev>
 <20261107124255.41144-1-zeshanahmednobin@gmail.com>

November 7, 2026 at 1:42 PM, "Zeshan Ahmed Nobin" <zeshanahmednobin@gmail=
.com> wrote:

[ ... ]

> So I'd like to keep this patch to bw only and drop the nrx part in v2.
> The nrx case is worth its own fix. I'm happy to send a separate patch
> for it (I could only test it on PCIe by forcing the value, not on a USB
> device), unless you'd rather send it yourself since you found it.

Sounds good to me. Please go ahead and send it whenever you have time.

The USB device I have is an RTL8723DU, so I can't test that either.
Forcing the value on PCIe seems fine to me. Maybe just note under the
--- line that this is how it was tested.

Best regards,
Luka Gejak
