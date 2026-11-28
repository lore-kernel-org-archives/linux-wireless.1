Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880650;
	b=a2DSSbb2gX6W3c4hVQtRN2CcuvbaFZOzhSmeXP371gY9anCqIjYJeRRcV0xuEjlm2Cb3
	 O1GpseYWyfRg6LLLwqlg5JtJzCdCVcaOuO8xv3rREH+z88n2X3RgEVxmRU48IwYLrG548
	 oeYAzDa0MefPpBhA6UceYmiZiaMr5FBarzMgNGHtqv4HrxM1J1tl8Bs0/QUsoBvI/fubL
	 2gdKo95nApLDv5HmaXhCMjRvu4Q9kZgT1fEGN9QDd9no6P8y2X+6FT7tF1YvdjlOeEpGc
	 7ec0WF36t45M5y/HjUkAh9Xl0mnreOSJ8PCxshMJ7p2SLzfBRKJqR4Q3t1N0vmDXKCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880650;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=C6fnb3kKBBl5G513BOvcPV1jkJKBSW+1K92Xim9Nxrs=;
	b=TqwC44zmiDoI7GDWxn9J9bzBULP2yQub3tac4E9loNFVidwqlUvNQhFys6cNLaIW/4Z1
	 Ha3ofXv3frpVYqiVqqcO16R2ldI6F3biKvNbkp5r37RR1CXqkmY6LHGAg5Z41hTrOp5DU
	 i7W42VpYrep2fYOS+W3ApfDzI0aNlo5u/a0VGxTPkWdtIEHESmD2teynm/KbnjdkiyHKh
	 8HlhlT2O5IG2ZDhpsJuGxby0McuIKFneAHImITsB+17dJ1/NRaB/87XVwl9z5iMeAPFIh
	 CXtRu2lE97+je2DQ8GMzIzPESU9aDMikVvhph/tw52WRiHeEMRAYZg7oJIAmfnu2PTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RQF6ZfZx;
	arc=none smtp.remote-ip=95.215.58.155
Received: from mta1.migadu.com (out-155.mta1.migadu.com [95.215.58.155])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0DB606A31F
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 15:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC0DB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RQF6ZfZx
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=C6fnb3kKBBl5G513BOvcPV1jkJKBSW+1K92Xim9Nxrs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795880647; v=1; x=1796485447;
 b=RQF6ZfZxwm4HBlwDRGcKGw6yRoW7L7QPPBjyr7oD7WitFwiNTG5quMjPs/sR3XoAhTpqlb8H
 +QFZEv4sv4SILuLdbuSTpme1dclKGk+nefvR/m1a536cdreSdxLIajnhNCFYON1JgALMK9NV3G1
 B7GN+Ge/UdmsN8AGVzCC0yiw=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ba87b1038116fec2;
	Sat, 28 Nov 2026 15:44:07 +0000
X-Mizu-Trace-ID: ba87b1038116fec2
X-Migadu-Flow: FLOW_OUT
Date: Sat, 28 Nov 2026 16:44:07 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v5_4/7=5D_wifi=3A_rtw88=3A_88?=
 =?US-ASCII?Q?xxa=3A_receive_VHT_SU_beamformed_transmissions?=
In-Reply-To: <20261127180034.1058591-5-hjf3108@gmail.com>
References: <20261127180034.1058591-1-hjf3108@gmail.com> <20261127180034.1058591-5-hjf3108@gmail.com>
Message-ID: <A95AA5C2-D7F2-42DB-8F35-C0CD10BC8555@linux.dev>
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

On November 27, 2026 7:00:24 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:
>RTL8812A, RTL8821A and RTL8814A can be a VHT SU beamformee, but they
>have no config_bfee callback and bfer_su_max_num is 0, so
>rtw_bf_assoc() never sets them up.
>
>This adds the SU beamformee setup for these chips, for up to two
>beamformers. This is done by enabling sounding to the AP and
>setting the correct CSI report parameters.
>
>Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
>---

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
