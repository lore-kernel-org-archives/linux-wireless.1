Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921481;
	b=HVnoZTwJO+9Ui9KYG57LZ7IPWLDMshL8bqGBXaiJnay82ZFE53gFPFdW1EvdIC5VYysn
	 fjV5VR2qTj/gyTIXwMLmIIjYCYrTMshsL1WeMzFzzzjLm/g0JJomsudfEab+kZMDw8SPd
	 V/hzIlhmgtCxp3SMaUco6ZTNyIfDOcznvSWg6fK1BoByU+2udSxsBThXQBcpZhaD5xPPj
	 7rkXlJ3SD9r3OPclY05YvLk2GHME9HEP1UyauhhOnWgCvhE6xfhMD9q+1E8y2U7jazyUA
	 nLxD+CMzc12CNewYUruadYqnyl/ivCIOc204X1WZ82IN15TCOeVLwJ6M4ufAM9fKcWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921481;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=P2I90b+krcboUISBDbbNPUBfl+9yB5IkjOhn3HmKi1U=;
	b=jNVzXMznsn7jC7c1asvBpQ4FJ1LljB6vzRuiJJX6h2POWn1qvFLjM1yTSU75pO1Wteo+
	 yDHhgOxveSsVBm6A6mx2CLT+HRTqHzyGCrLgi6etflZCy/1J6WQgwuGwIiM9IMo91HxMG
	 Eb0VowAwbx6uBQ3HF8HdkqwvDao9/fZeQpS/8iqDqKjUAV4YovcTsObOLVF4Y7LY0AfNO
	 Ka7l2hUaVTUpK7hnrxE1v+V3rg9IqGqGytNcjyXjjk6iDPEkTVVQiwKsnA4GfE58Gx1w6
	 KNAT85f7Nycksigu6V8/nm5b4t+O0zH49TzbRCjCwd7TfYJEVzuxwvT3JOEwSg1NNcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MFlR9+4z;
	arc=none smtp.remote-ip=95.215.58.99
Received: from mta1.migadu.com (out-99.mta1.migadu.com [95.215.58.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1DA606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 13:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D1DA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MFlR9+4z
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=P2I90b+krcboUISBDbbNPUBfl+9yB5IkjOhn3HmKi1U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794921478; v=1; x=1795526278;
 b=MFlR9+4z5mo11mIUquX2YZREqSrTOXVmumhQCX2nHIpnxyTVDk5zZg7IMQNM/9QUwxgH+gys
 txu0kxlFh+ShxtYbfkNI4fW9licrXpNBRAlVnAAqRBSxYJ5KjRq7w2PzLwFbtdx9Vocgx48F4RR
 RLc5EnQwRE1XuLfMrXvrUrV8=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4e0f9b08c28aa42c;
	Tue, 17 Nov 2026 13:17:58 +0000
X-Mizu-Trace-ID: 4e0f9b08c28aa42c
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 14:17:46 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ping-Ke Shih <pkshih@realtek.com>,
 Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kalle Valo <kvalo@kernel.org>
Subject: =?US-ASCII?Q?RE=3A_=5BPATCH_rtw-next_v3_2/2=5D_wifi=3A_rtw88=3A_8822?=
 =?US-ASCII?Q?c=3A_ignore_nrx_values_without_CCK_PD_registers?=
In-Reply-To: <427f6f2e79474058958c3f3d0901df38@realtek.com>
References: <20261115201826.181662-1-zeshanahmednobin@gmail.com> <20261115201826.181662-3-zeshanahmednobin@gmail.com> <427f6f2e79474058958c3f3d0901df38@realtek.com>
Message-ID: <8023529A-60D3-4708-9772-027436BF7756@linux.dev>
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

Hi Ping-Ke,

Thanks for looking at this. I would just like to add something.

On November 17, 2026 7:38:21 AM GMT+01:00, Ping-Ke Shih
<pkshih@realtek.com> wrote:

[ ... ]

> Since this only can happen when a device is removed suddenly, how about
> reverting patch 1, and also validate bw <= RTW_CHANNEL_WIDTH_40 here.

As far as I can see, rtw_set_channel() stores the bandwidth in hal and
passes the same value to the chip's set_channel callback. We already
use hal.current_band_width when setting TX power.

CCK PD already checks hal.current_band_type and only runs on 2.4 GHz,
where the bandwidth is 20 or 40 MHz. So I think using the stored value
here is reasonable too. It avoids another register read and keeps a
failed read from becoming the bandwidth index.

Would you be okay with keeping patch 1 and using nrx > RF_PATH_B in
patch 2, as you suggested?

Best regards,
Luka Gejak
