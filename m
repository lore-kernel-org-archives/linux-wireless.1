Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.149.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187534;
	b=1dZ4tVsrD5MXodnCJVFrz3MLLb/BSVsr2IQcIuKkadqvUOXi6l4pbLnVRne/KKP2xKmF
	 Uv9WH/MQOWe0H1TxMxeJXNxdTgoBX7eVYcUgoEZdqHezDbU3fW3o3kMfQltbldBTf4+4f
	 bkCapkCKoc7xMHxDzjllFFzU8MCMwY1pgv+oxs442/F73zR1bYhxve8sYLiCBjRaqGAzY
	 zX6AZeptITVtkNpNEGbN380p4X42CaiOxmqZ1kABwXxpjlKSUMTS8hYaneNpqDpfivdxP
	 z3tzScTb0JCCGmCrLKXhC6Xh/VGfzNtlMrXsVYp4t09/n3VyDx5Oq2Q0see17fWB2RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187534;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=daTsDeQGzIS/pEaFFotVFCgwkhgHjyeoEtPDBXN6kGo=;
	b=f51MLawhAp5DdNMik0m7HnolPj+1nc56o2uwjJ54bZhnQKMD3sMDOzABnxEgNoyn4LBY
	 wXGy3luBy1LbxDIvIkDY+O0a34Wz7I9/Sz7ooR7Ds+fa6If2BrDhFvsW6Sq10wwY4LBOA
	 BEXCq6/9/C6VBB8FTZKThEHOdFtWPR+nETPvm2e+X21gJAoIIIwHfYDho4T1qRRBjb34d
	 D7qcXoCO07XtGfL02won7CfTrqUJAEQeXuD41K1lSHBsqD5O94nR34R26ac5qzVOHZh+8
	 oypXpadGJtdApyTv90Vu0QS6/Bzu3eSw+3xdemfn3y90g2O+FAwRDKprDti+ghWT3NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mythread.it;
	spf=pass smtp.mailfrom=mythread.it;
	dkim=pass header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=JrYf9N8u;
	arc=none smtp.remote-ip=62.149.155.101
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3D5606A320
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 01:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E3D5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mythread.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mythread.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mythread.it header.i=@mythread.it header.a=rsa-sha256 header.s=a1 header.b=JrYf9N8u
Received: from localhost ([87.16.49.252])
	by Aruba SMTP with ESMTPSA
	id QE8Sx8Tkh6KjvQE8TxqDRE; Mon, 09 Nov 2026 02:25:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mythread.it; s=a1;
	t=1794187525; bh=hAadhz8TUc/HNEn1c+Elr0DSD4ow8/DeRqXXhGYf/PQ=;
	h=Date:From:To:Subject:MIME-Version:Content-Type;
	b=JrYf9N8uKXqRn7u029McQT4URdzC/DpJJdxPFDGYlyr2tRE9aPSRY6ZrniVWFmmzo
	 DeCXFoN0h+SDWWmJHkQjk74qr5qbQZc5lB8HfFiyV9fvsXtPVBDvdFbPjHZFmABJ0j
	 2qdv8K0Gyf4QAMuT3yf9Xw8bB5sX0PvgjeKWPjt+UvnEg1rEQBCAPnTWmeZfIGhjfa
	 a8ViJQDSaVMYrqh/o64Su+MjQFrzcsGtN3hZX5+zHIgROvUywpx7MdtcpuggDyB8mk
	 yL37ibTL6KNx4R5ePeItBZ3tFqL89S1dcHKfvWFjl7C0wV3GuTVjAUWxqpn/VjDdpE
	 HWwWxHuWR8B3Q==
Date: Mon, 9 Nov 2026 02:25:22 +0100
From: Alessio Ferri <alessio.ferri@mythread.it>
To: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Michael Buesch
 <m@bues.ch>
Cc: vit9696 <vit9696@protonmail.com>, ville+git@takio.fi, egc112@msn.com,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, b43-dev@lists.infradead.org
Subject: [PATCH wireless-next v4 09/10] bcma: add the single-band
 BCM4352/BCM4360 PCI IDs
Message-ID: <20261109022522.00000129@mythread.it>
In-Reply-To: <20261109-bcma-ac-rev1-v4-0-de1262c18b54@mythread.it>
References: <20261109-bcma-ac-rev1-v4-0-de1262c18b54@mythread.it>
X-Mailer: Claws Mail 3.21.0 (GTK+ 2.24.33; x86_64-w64-mingw32)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOq7IXKFgCfLgYZYlJrjezaSC0lTnPTpKEFkNgnD34xuDVmpMJc1RIQu9C6KPVAfXQs1pKzEVn01HxWtiA5FP60Xr6aS7Knt4HYaLV3PVP+mQc2INKol
 dZbinE+y6987+SN8ZqX/weDwsmnLCIaTrefWdLXtm/RvcNDxcgtAfr5gbF3QgELNZD24y2QNgeUSiKyDXVPZGPkryLVePwfSs3LPz6at6vSqLfpMLLb10h5i
 sii4liaS6pUTMGs03+5qhaQPxPCEOc3VZm0YpAKwd1rVY+BXGTzMndDN3Dl0laWXYmmj1ldaB9eYU2e//RaINHnkrsMTWNVcidnxH5p/2fbOUEYVmKIrpl84
 YlFBo+NSpqTuTMDHR+lNrK4t/cpVP1AKNs/6Tsz/4t/L8Esuy4Fq+NRFbPJ1iHpRUiluDUmSD/9DurSSer73qKtNy2SS+IkRIkiceu87ojtaBDHWdzY=


Bind bcma-pci-bridge to the 2.4 GHz and 5 GHz variants of the BCM4360
(0x43a1, 0x43a2) and BCM4352 (0x43b2, 0x43b3), next to the dual-band
0x43a0 and 0x43b1, and name the chip and band of each.

Signed-off-by: Alessio Ferri <alessio.ferri@mythread.it>
---
 drivers/bcma/host_pci.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/bcma/host_pci.c b/drivers/bcma/host_pci.c
index 3dc298506..27f6cc10a 100644
--- a/drivers/bcma/host_pci.c
+++ b/drivers/bcma/host_pci.c
@@ -294,10 +294,14 @@ static const struct pci_device_id bcma_pci_bridge_tbl[] = {
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_BROADCOM, 0x4365, PCI_VENDOR_ID_DELL, 0x0018) },
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_BROADCOM, 0x4365, PCI_VENDOR_ID_FOXCONN, 0xe092) },
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_BROADCOM, 0x4365, PCI_VENDOR_ID_HP, 0x804a) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_BROADCOM, 0x43a0) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_BROADCOM, 0x43a0) },	/* BCM4360 */
+	{ PCI_DEVICE(PCI_VENDOR_ID_BROADCOM, 0x43a1) },	/* BCM4360, 2.4 GHz */
+	{ PCI_DEVICE(PCI_VENDOR_ID_BROADCOM, 0x43a2) },	/* BCM4360, 5 GHz */
 	{ PCI_DEVICE(PCI_VENDOR_ID_BROADCOM, 0x43a9) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_BROADCOM, 0x43aa) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_BROADCOM, 0x43b1) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_BROADCOM, 0x43b1) },	/* BCM4352 */
+	{ PCI_DEVICE(PCI_VENDOR_ID_BROADCOM, 0x43b2) },	/* BCM4352, 2.4 GHz */
+	{ PCI_DEVICE(PCI_VENDOR_ID_BROADCOM, 0x43b3) },	/* BCM4352, 5 GHz */
 	{ PCI_DEVICE(PCI_VENDOR_ID_BROADCOM, 0x4727) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_BROADCOM, 43227) },	/* 0xa8db, BCM43217 (sic!) */
 	{ PCI_DEVICE(PCI_VENDOR_ID_BROADCOM, 43228) },	/* 0xa8dc */
-- 
2.34.1
