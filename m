Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880682;
	b=fFw2HCNVXqKuRx3Me7cVqt5RItcd08XFWNVZ9UKPyi4dAeYa+TmfWn8KmR6WnW4NNn0a
	 ZhgdpRxFZ/QaXJ2kRs0R79Sttgji06bTOvivOtRFNeSuuFleAKAQehWykCgl7/7WcrpkP
	 PrPwS5L8KiCVhKAX9D4xIACMDHe6XSgkEeTKvcKFg2MXtI71GhIC0L4F0UO80a5/jRv2Z
	 pR882074IOW6bu3dR5w1XwpYUejjFzh6sAfiEPYVlKAR+wbp5XdY+rE6gDyqpvM6AVQke
	 cGIrSlW5un893MolnHYyFLII0Uu3qndXX3Kfx8vhqjgzvlMZ+nvQK9UNf4D3TmKI+yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880682;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=avFvvrtWpqsmH3ml4j2leBd0C6Wf3+uY+Jh1jw5x3bw=;
	b=xFypv9CshZJPpGfyY4P7n63tAKCqF1Dh/IsF0HroboMXFo5xo5wqHCyPXCw7aAkktYN2
	 0mWztuhQD3dXnozSrwdKIBdQwe94zwaQduT2ikvACuMg26ctP5hYwhGMIUS7XqqyZ7956
	 P2znWd2MAVq4AYpOsHHS5yFgovRbEzxI/0ZT/SChKiu+EXsy8qTlJTASv9tUV7X81G/XD
	 LOri+5DAFmayJkdOjFUUFhlpXurX4ReUeMVawHY+Zsvg3EbSKsj5R0d6du2yLbB9auzDJ
	 g4DxA8loH9piTDugGaZ/WIbjtJm2GAli0oKgqS2T756cGYnZcWDMv3f8n/VGRMWULoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PkOADC8u;
	arc=none smtp.remote-ip=95.215.58.161
Received: from mta1.migadu.com (out-161.mta1.migadu.com [95.215.58.161])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACA4606A325
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 15:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ACA4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PkOADC8u
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=avFvvrtWpqsmH3ml4j2leBd0C6Wf3+uY+Jh1jw5x3bw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795880679; v=1; x=1796485479;
 b=PkOADC8uodWfguHEWhYTofM/YKG7KpdAKMLPrugigfq1wmcjlpbvj4bbG/5XJ+Fwhzc8rGc7
 JObrL4hp0eeMmtyB9uWj0B2NLUbKUZ9jMw3gKuRMln5JKzcdJmujO1hvnu76fJ8ynDL9ao2RWkd
 ZUspib9CaEley3VOGE7dpemU=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id de875a6b0342181e;
	Sat, 28 Nov 2026 15:44:39 +0000
X-Mizu-Trace-ID: de875a6b0342181e
X-Migadu-Flow: FLOW_OUT
Date: Sat, 28 Nov 2026 16:44:37 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v5_7/7=5D_wifi=3A_rtw88=3A_88?=
 =?US-ASCII?Q?12a=2C_8821a=3A_respect_peer_A-MPDU_size_limits?=
In-Reply-To: <20261127180034.1058591-8-hjf3108@gmail.com>
References: <20261127180034.1058591-1-hjf3108@gmail.com> <20261127180034.1058591-8-hjf3108@gmail.com>
Message-ID: <8C60F8E1-BA73-44C7-B837-9FF401391234@linux.dev>
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

On November 27, 2026 7:00:27 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:
>Previously, these chips had no set_ampdu_factor callback, so
>rtw_set_ampdu_factor() returned before programming the peer's
>limit.
>
>Honor the peer-advertised receive limit for transmitted A-MPDUs.
>
>Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
>---

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
